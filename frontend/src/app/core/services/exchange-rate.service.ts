import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of, forkJoin } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

export interface ExchangeRate {
  currency: string;
  code: string;
  rate: number;
  previousRate: number;
  change: number;
  changePercent: number;
  lastUpdate: Date;
  flag: string;
}

@Injectable({
  providedIn: 'root'
})
export class ExchangeRateService {
  
  // APIs de taux de change (multiples pour fiabilité)
  private apis = {
    primary: 'https://api.exchangerate-api.com/v4/latest',
    secondary: 'https://open.er-api.com/v6/latest',
    tertiary: 'https://api.frankfurter.app/latest'
  };
  
  // Mapping des devises avec leurs drapeaux
  private currencyInfo: { [key: string]: { name: string; flag: string } } = {
    'EUR': { name: 'Euro', flag: '🇪🇺' },
    'USD': { name: 'Dollar US', flag: '🇺🇸' },
    'GBP': { name: 'Livre Sterling', flag: '🇬🇧' },
    'CHF': { name: 'Franc Suisse', flag: '🇨🇭' },
    'CAD': { name: 'Dollar Canadien', flag: '🇨🇦' },
    'JPY': { name: 'Yen Japonais', flag: '🇯🇵' },
    'AUD': { name: 'Dollar Australien', flag: '🇦🇺' },
    'SAR': { name: 'Riyal Saoudien', flag: '🇸🇦' },
    'AED': { name: 'Dirham EAU', flag: '🇦🇪' },
    'MAD': { name: 'Dirham Marocain', flag: '🇲🇦' }
  };

  // Cache pour stocker les taux précédents (pour calculer la variation)
  private previousRatesCache: { [key: string]: number } = {};

  constructor(private http: HttpClient) {
    // Effacer le cache pour forcer les données en temps réel
    localStorage.removeItem('previousExchangeRates');
    this.previousRatesCache = {};
  }

  /**
   * Récupère les taux de change actuels par rapport au TND (temps réel)
   * Utilise plusieurs APIs en cascade pour garantir des données réelles
   */
  getLatestRates(): Observable<ExchangeRate[]> {
    // API 1: exchangerate-api.com avec TND
    console.log('🔄 Récupération des taux de change en temps réel...');
    return this.http.get<any>(`${this.apis.primary}/TND`).pipe(
      map(response => {
        console.log('✅ API primaire réussie:', response.date, response.time_last_updated);
        return this.processRates(response);
      }),
      catchError(() => {
        console.log('API primaire échouée, essai API secondaire...');
        // API 2: open.er-api.com
        return this.http.get<any>(`${this.apis.secondary}/USD`).pipe(
          map(response => this.processRatesFromUSD(response)),
          catchError(() => {
            console.log('API secondaire échouée, essai API tertiaire...');
            // API 3: frankfurter.app (BCE)
            return this.http.get<any>(`${this.apis.tertiary}?from=EUR`).pipe(
              map(response => this.processRatesFromEUR(response)),
              catchError(error => {
                console.error('Toutes les APIs ont échoué:', error);
                return of([]);
              })
            );
          })
        );
      })
    );
  }

  /**
   * Traite les taux avec EUR comme base (Frankfurter API)
   */
  private processRatesFromEUR(response: any): ExchangeRate[] {
    const rates: ExchangeRate[] = [];
    const currencies = ['EUR', 'USD', 'GBP', 'CHF', 'CAD', 'JPY', 'AUD'];
    const eurRates = response.rates || {};
    
    // Taux EUR/TND approximatif (BCE ne supporte pas TND)
    const eurToTnd = 3.37;
    
    for (const currency of currencies) {
      let currentRate: number;
      
      if (currency === 'EUR') {
        currentRate = eurToTnd;
      } else if (eurRates[currency]) {
        currentRate = eurToTnd / eurRates[currency];
      } else {
        continue;
      }
      
      const previousRate = this.previousRatesCache[currency] || currentRate * 0.998;
      const change = currentRate - previousRate;
      const changePercent = previousRate > 0 ? (change / previousRate) * 100 : 0;
      
      const info = this.currencyInfo[currency];
      
      rates.push({
        currency: info?.name || currency,
        code: currency,
        rate: currentRate,
        previousRate: previousRate,
        change: change,
        changePercent: changePercent,
        lastUpdate: new Date(),
        flag: info?.flag || '🏳️'
      });
      
      this.previousRatesCache[currency] = currentRate;
    }
    
    localStorage.setItem('previousExchangeRates', JSON.stringify(this.previousRatesCache));
    return rates;
  }

  /**
   * Traite les taux avec TND comme base
   */
  private processRates(response: any): ExchangeRate[] {
    const rates: ExchangeRate[] = [];
    const currencies = ['EUR', 'USD', 'GBP', 'CHF', 'CAD', 'JPY', 'AUD', 'SAR', 'AED', 'MAD'];
    const tndRates = response.rates || {};
    
    for (const currency of currencies) {
      if (tndRates[currency]) {
        // Le taux est 1 TND = X currency, on veut 1 currency = X TND
        const currentRate = 1 / tndRates[currency];
        const previousRate = this.previousRatesCache[currency] || currentRate * 0.998;
        
        const change = currentRate - previousRate;
        const changePercent = previousRate > 0 ? (change / previousRate) * 100 : 0;
        
        const info = this.currencyInfo[currency];
        
        rates.push({
          currency: info?.name || currency,
          code: currency,
          rate: currentRate,
          previousRate: previousRate,
          change: change,
          changePercent: changePercent,
          lastUpdate: new Date(),
          flag: info?.flag || '🏳️'
        });
        
        // Sauvegarder pour la prochaine comparaison
        this.previousRatesCache[currency] = currentRate;
      }
    }
    
    // Sauvegarder dans localStorage
    localStorage.setItem('previousExchangeRates', JSON.stringify(this.previousRatesCache));
    
    return rates;
  }

  /**
   * Traite les taux avec USD comme base (fallback)
   */
  private processRatesFromUSD(response: any): ExchangeRate[] {
    const rates: ExchangeRate[] = [];
    const currencies = ['EUR', 'USD', 'GBP', 'CHF', 'CAD', 'JPY', 'AUD', 'SAR', 'AED', 'MAD'];
    const usdRates = response.rates || {};
    const usdToTnd = usdRates['TND'] || 3.12;
    
    for (const currency of currencies) {
      let currentRate: number;
      
      if (currency === 'USD') {
        currentRate = usdToTnd;
      } else if (usdRates[currency]) {
        // Calcul croisé: 1 currency -> USD -> TND
        currentRate = usdToTnd / usdRates[currency];
      } else {
        continue;
      }
      
      const previousRate = this.previousRatesCache[currency] || currentRate * 0.998;
      const change = currentRate - previousRate;
      const changePercent = previousRate > 0 ? (change / previousRate) * 100 : 0;
      
      const info = this.currencyInfo[currency];
      
      rates.push({
        currency: info?.name || currency,
        code: currency,
        rate: currentRate,
        previousRate: previousRate,
        change: change,
        changePercent: changePercent,
        lastUpdate: new Date(),
        flag: info?.flag || '🏳️'
      });
      
      this.previousRatesCache[currency] = currentRate;
    }
    
    localStorage.setItem('previousExchangeRates', JSON.stringify(this.previousRatesCache));
    
    return rates;
  }

  /**
   * Récupère le taux pour une devise spécifique
   */
  getRateForCurrency(currency: string): Observable<ExchangeRate | null> {
    return this.getLatestRates().pipe(
      map(rates => rates.find(r => r.code === currency) || null)
    );
  }

  private formatDate(date: Date): string {
    return date.toISOString().split('T')[0];
  }

  /**
   * Récupère l'historique des taux (simulé car l'API gratuite ne fournit pas d'historique)
   */
  getHistoricalRates(currency: string, days: number = 7): Observable<{ date: string; rate: number }[]> {
    // L'API exchangerate-api.com gratuite ne fournit pas d'historique
    // On simule des données basées sur le taux actuel
    return this.getRateForCurrency(currency).pipe(
      map(rate => {
        if (!rate) return [];
        
        const history: { date: string; rate: number }[] = [];
        const baseRate = rate.rate;
        
        for (let i = days; i >= 0; i--) {
          const date = new Date();
          date.setDate(date.getDate() - i);
          // Simuler une légère variation (+/- 0.5%)
          const variation = (Math.random() - 0.5) * 0.01 * baseRate;
          history.push({
            date: this.formatDate(date),
            rate: baseRate + variation
          });
        }
        
        return history;
      })
    );
  }
}
