package tn.cnss.cooperation.debit.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.debit.dto.GenerateDebitRequest;
import tn.cnss.cooperation.debit.entity.Debit;
import tn.cnss.cooperation.debit.repository.DebitRepository;

import java.math.BigDecimal;

@Service
@RequiredArgsConstructor
@Slf4j
public class DebitService {
    
    private final DebitRepository debitRepository;
    
    @Transactional
    public Debit generateDebit(GenerateDebitRequest request) {
        log.info("Génération débit pour affiliation: {}, trimestre: {}", 
                request.getNumAffiliation(), request.getTrimestre());
        
        // Si trimestre déjà déclaré, ne pas générer
        if (Boolean.TRUE.equals(request.getTrimestreDejaDeclare())) {
            log.warn("Trimestre déjà déclaré, pas de génération débit");
            return null;
        }
        
        Debit debit = new Debit();
        debit.setNumAffiliation(request.getNumAffiliation());
        debit.setTrimestre(request.getTrimestre());
        debit.setDateEffet(request.getDateEffet());
        debit.setMontantCotisation(calculateCotisation());
        debit.setPaye(false);
        
        debit = debitRepository.save(debit);
        log.info("Débit créé avec succès, ID: {}", debit.getId());
        
        return debit;
    }
    
    private BigDecimal calculateCotisation() {
        // Calcul simplifié - à adapter selon règles CNSS
        return new BigDecimal("600.000");
    }
    
    public Debit getDebit(String numAffiliation, String trimestre) {
        return debitRepository.findByNumAffiliationAndTrimestre(numAffiliation, trimestre)
                .orElseThrow(() -> new RuntimeException("Débit non trouvé"));
    }
}
