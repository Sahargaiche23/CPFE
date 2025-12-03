package tn.cnss.cooperation.affiliation.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.affiliation.dto.CreateAffiliationRequest;
import tn.cnss.cooperation.affiliation.entity.Affiliation;
import tn.cnss.cooperation.affiliation.repository.AffiliationRepository;

@Service
@RequiredArgsConstructor
@Slf4j
public class AffiliationService {
    
    private final AffiliationRepository affiliationRepository;
    private final RabbitTemplate rabbitTemplate;
    
    @Transactional
    public Affiliation createAffiliation(CreateAffiliationRequest request) {
        log.info("Création affiliation pour matricule: {}", request.getMatricule());
        
        Affiliation affiliation = new Affiliation();
        affiliation.setNumAffiliation(generateNumAffiliation(request));
        affiliation.setMatricule(request.getMatricule());
        affiliation.setDateEffet(request.getDateEffet());
        affiliation.setDateAssujettissement(request.getDateAssujettissement());
        affiliation.setRegime(request.getRegime());
        
        affiliation = affiliationRepository.save(affiliation);
        
        // Publier événement pour débit automatique
        rabbitTemplate.convertAndSend("cooperation-exchange", 
                "affiliation.created", affiliation);
        
        log.info("Affiliation créée: {}", affiliation.getNumAffiliation());
        return affiliation;
    }
    
    private String generateNumAffiliation(CreateAffiliationRequest request) {
        return String.format("%s%08d%02d", 
                request.getRegime(), 
                request.getMatricule(), 
                request.getCle() != null ? request.getCle() : 0);
    }
    
    public Affiliation getByNumAffiliation(String numAffiliation) {
        return affiliationRepository.findByNumAffiliation(numAffiliation)
                .orElseThrow(() -> new RuntimeException("Affiliation non trouvée"));
    }
}
