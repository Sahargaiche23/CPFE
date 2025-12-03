package tn.cnss.cooperation.salary.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

/**
 * Service de récupération des taux de change BCT
 * Dans un vrai système, cela appellerait l'API BCT
 * Pour l'instant, utilisation de taux simulés
 */
@Service
@Slf4j
public class ExchangeRateService {
    
    // Taux de change simulés (à remplacer par API BCT réelle)
    private static final Map<String, BigDecimal> EXCHANGE_RATES = new HashMap<>();
    
    static {
        EXCHANGE_RATES.put("EUR", new BigDecimal("3.250")); // 1 EUR = 3.250 TND
        EXCHANGE_RATES.put("USD", new BigDecimal("3.100")); // 1 USD = 3.100 TND
        EXCHANGE_RATES.put("CAD", new BigDecimal("2.300")); // 1 CAD = 2.300 TND
        EXCHANGE_RATES.put("GBP", new BigDecimal("3.800")); // 1 GBP = 3.800 TND
        EXCHANGE_RATES.put("CHF", new BigDecimal("3.400")); // 1 CHF = 3.400 TND
        EXCHANGE_RATES.put("SAR", new BigDecimal("0.827")); // 1 SAR = 0.827 TND
        EXCHANGE_RATES.put("AED", new BigDecimal("0.844")); // 1 AED = 0.844 TND
    }
    
    /**
     * Récupérer le taux de change BCT pour une devise à une date donnée
     * 
     * @param devise Code ISO de la devise (EUR, USD, etc.)
     * @param date Date du cours (1er jour de détachement)
     * @return Taux de change
     */
    public BigDecimal getExchangeRate(String devise, LocalDate date) {
        log.info("Récupération taux de change BCT pour {} au {}", devise, date);
        
        // Simulation: retourner taux fixe
        // Dans un vrai système: appel API BCT avec la date
        BigDecimal rate = EXCHANGE_RATES.getOrDefault(devise, BigDecimal.ONE);
        
        if (rate.equals(BigDecimal.ONE) && !devise.equals("TND")) {
            log.warn("Taux de change non disponible pour {}, utilisation de 1.0", devise);
        }
        
        return rate;
    }
    
    /**
     * Méthode pour importer manuellement le cours BCT
     * (Comme mentionné dans le cahier des charges: "impression cour devise BCT manuel")
     */
    public void importExchangeRate(String devise, BigDecimal rate, LocalDate date) {
        log.info("Import manuel cours BCT: {} = {} TND au {}", devise, rate, date);
        // Dans un vrai système: sauvegarder dans une table EXCHANGE_RATE avec date
        EXCHANGE_RATES.put(devise, rate);
    }
}
