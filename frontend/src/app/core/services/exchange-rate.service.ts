import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError, tap } from 'rxjs/operators';

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

interface CachedRates {
  rates: { [code: string]: number };
  date: string;
  timestamp: number;
}

@Injectable({
  providedIn: 'root'
})
export class ExchangeRateService {

  private readonly CACHE_KEY = 'cnss_exchange_rates';
  private readonly PREV_CACHE_KEY = 'cnss_exchange_rates_prev';
  private readonly CACHE_DURATION = 4 * 60 * 60 * 1000; // 4 heures

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
    'MAD': { name: 'Dirham Marocain', flag: '🇲🇦' },
    'QAR': { name: 'Riyal Qatari', flag: '🇶🇦' },
    'KWD': { name: 'Dinar Koweïtien', flag: '🇰🇼' },
    'LYD': { name: 'Dinar Libyen', flag: '🇱🇾' },
    'DZD': { name: 'Dinar Algérien', flag: '🇩🇿' }
  };

  private readonly targetCurrencies = [
    'EUR', 'USD', 'GBP', 'CHF', 'CAD', 'JPY', 'AUD',
    'SAR', 'AED', 'MAD', 'QAR', 'KWD', 'LYD', 'DZD'
  ];

  constructor(private http: HttpClient) {}

  /**
   * Récupère les taux de change actuels par rapport au TND
   * Stratégie : Cache localStorage → API 1 → API 2 → API 3 → Fallback statique
   */
  getLatestRates(): Observable<ExchangeRate[]> {
    // Vérifier le cache d'abord
    const cached = this.getFromCache();
    if (cached) {
      console.log('📦 Taux chargés depuis le cache (valide)');
      return of(this.buildExchangeRates(cached.rates, new Date(cached.timestamp)));
    }

    // API 1 : open.er-api.com (gratuite, CORS OK, supporte TND)
    console.log('🔄 Récupération des taux en temps réel...');
    return this.http.get<any>('/exchange-api/v6/latest/USD').pipe(
      map(response => {
        console.log('✅ API open.er-api réussie');
        const usdRates = response.rates || {};
        return this.processFromUSD(usdRates);
      }),
      tap(rates => this.saveToCache(rates)),
      catchError(() => {
        console.warn('⚠️ API 1 échouée, essai Frankfurter...');
        // API 2 : frankfurter.app (BCE, CORS OK)
        return this.http.get<any>('/frankfurter-api/latest?from=USD&to=EUR,GBP,CHF,CAD,JPY,AUD,MAD,TND').pipe(
          map(response => {
            console.log('✅ API Frankfurter réussie');
            const rates = response.rates || {};
            return this.processFromUSD(rates);
          }),
          tap(rates => this.saveToCache(rates)),
          catchError(() => {
            console.warn('⚠️ API 2 échouée, essai direct...');
            // API 3 : appel direct (sans proxy)
            return this.http.get<any>('https://open.er-api.com/v6/latest/USD').pipe(
              map(response => {
                console.log('✅ API directe réussie');
                return this.processFromUSD(response.rates || {});
              }),
              tap(rates => this.saveToCache(rates)),
              catchError(() => {
                console.warn('⚠️ Toutes les APIs échouées → fallback statique');
                // Vérifier s'il y a un ancien cache (même expiré)
                const oldCache = this.getFromCache(true);
                if (oldCache) {
                  console.log('📦 Utilisation de l\'ancien cache');
                  return of(this.buildExchangeRates(oldCache.rates, new Date(oldCache.timestamp)));
                }
                return of(this.getFallbackRates());
              })
            );
          })
        );
      })
    );
  }

  /**
   * Traite les taux à partir de USD comme devise de base
   * Calcul croisé : 1 DEVISE = (TND/USD) / (DEVISE/USD) = taux en TND
   */
  private processFromUSD(usdRates: { [key: string]: number }): ExchangeRate[] {
    const tndPerUsd = usdRates['TND'] || 3.12;
    const ratesMap: { [code: string]: number } = {};

    for (const code of this.targetCurrencies) {
      if (code === 'USD') {
        ratesMap[code] = tndPerUsd;
      } else if (usdRates[code]) {
        // 1 DEVISE en TND = tndPerUsd / (devise par 1 USD)
        ratesMap[code] = tndPerUsd / usdRates[code];
      }
    }

    return this.buildExchangeRates(ratesMap, new Date());
  }

  /**
   * Construit les objets ExchangeRate avec calcul de la variation journalière
   */
  private buildExchangeRates(ratesMap: { [code: string]: number }, updateDate: Date): ExchangeRate[] {
    const previousRates = this.getPreviousRates();
    const rates: ExchangeRate[] = [];

    for (const code of this.targetCurrencies) {
      if (!ratesMap[code]) continue;

      const currentRate = ratesMap[code];
      const previousRate = previousRates[code] || currentRate;
      const change = currentRate - previousRate;
      const changePercent = previousRate > 0 ? (change / previousRate) * 100 : 0;
      const info = this.currencyInfo[code];

      rates.push({
        currency: info?.name || code,
        code: code,
        rate: currentRate,
        previousRate: previousRate,
        change: change,
        changePercent: changePercent,
        lastUpdate: updateDate,
        flag: info?.flag || '🏳️'
      });
    }

    return rates;
  }

  // ─── Cache Management ──────────────────────────────────────────────

  private saveToCache(rates: ExchangeRate[]): void {
    const ratesMap: { [code: string]: number } = {};
    rates.forEach(r => ratesMap[r.code] = r.rate);

    // Sauvegarder les taux actuels comme "précédents" pour la prochaine fois
    const todayKey = new Date().toISOString().split('T')[0];
    const prevData = this.getFromCache(true);
    if (prevData && prevData.date !== todayKey) {
      // Nouveau jour → sauvegarder les anciens taux comme "précédents"
      localStorage.setItem(this.PREV_CACHE_KEY, JSON.stringify({
        rates: prevData.rates,
        date: prevData.date
      }));
    }

    const cached: CachedRates = {
      rates: ratesMap,
      date: todayKey,
      timestamp: Date.now()
    };
    localStorage.setItem(this.CACHE_KEY, JSON.stringify(cached));
  }

  private getFromCache(ignoreExpiry: boolean = false): CachedRates | null {
    try {
      const raw = localStorage.getItem(this.CACHE_KEY);
      if (!raw) return null;
      const cached: CachedRates = JSON.parse(raw);
      if (!ignoreExpiry && (Date.now() - cached.timestamp > this.CACHE_DURATION)) {
        return null; // Cache expiré
      }
      return cached;
    } catch {
      return null;
    }
  }

  private getPreviousRates(): { [code: string]: number } {
    try {
      const raw = localStorage.getItem(this.PREV_CACHE_KEY);
      if (!raw) return {};
      return JSON.parse(raw).rates || {};
    } catch {
      return {};
    }
  }

  // ─── Public helpers ────────────────────────────────────────────────

  getRateForCurrency(currency: string): Observable<ExchangeRate | null> {
    return this.getLatestRates().pipe(
      map(rates => rates.find(r => r.code === currency) || null)
    );
  }

  /**
   * Historique réel sur 7 jours via Frankfurter API (BCE)
   */
  getHistoricalRates(currency: string, days: number = 7): Observable<{ date: string; rate: number }[]> {
    const endDate = new Date();
    const startDate = new Date();
    startDate.setDate(startDate.getDate() - days);

    const from = this.formatDate(startDate);
    const to = this.formatDate(endDate);

    return this.http.get<any>(
      `/frankfurter-api/${from}..${to}?from=${currency}&to=TND`
    ).pipe(
      map(response => {
        const result: { date: string; rate: number }[] = [];
        const ratesData = response.rates || {};
        for (const date of Object.keys(ratesData).sort()) {
          if (ratesData[date]?.TND) {
            result.push({ date, rate: ratesData[date].TND });
          }
        }
        return result;
      }),
      catchError(() => {
        // Fallback: historique simulé basé sur le taux actuel
        return this.getRateForCurrency(currency).pipe(
          map(rate => {
            if (!rate) return [];
            const history: { date: string; rate: number }[] = [];
            for (let i = days; i >= 0; i--) {
              const d = new Date();
              d.setDate(d.getDate() - i);
              const variation = (Math.random() - 0.5) * 0.005 * rate.rate;
              history.push({ date: this.formatDate(d), rate: rate.rate + variation });
            }
            return history;
          })
        );
      })
    );
  }

  private formatDate(date: Date): string {
    return date.toISOString().split('T')[0];
  }

  // ─── Fallback statique (taux BCE approximatifs Mars 2026) ──────────

  private getFallbackRates(): ExchangeRate[] {
    const fallback: { [code: string]: number } = {
      'EUR': 3.37, 'USD': 3.12, 'GBP': 3.94, 'CHF': 3.45,
      'CAD': 2.25, 'JPY': 0.0209, 'AUD': 2.01, 'SAR': 0.832,
      'AED': 0.85, 'MAD': 0.312, 'QAR': 0.857, 'KWD': 10.15,
      'LYD': 0.645, 'DZD': 0.0231
    };
    return this.buildExchangeRates(fallback, new Date());
  }
}
