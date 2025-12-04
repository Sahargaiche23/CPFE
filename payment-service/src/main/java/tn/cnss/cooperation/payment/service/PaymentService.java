package tn.cnss.cooperation.payment.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.payment.dto.AddPaymentRequest;
import tn.cnss.cooperation.payment.entity.Payment;
import tn.cnss.cooperation.payment.repository.PaymentRepository;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class PaymentService {
    
    private final PaymentRepository paymentRepository;
    
    public List<Payment> getAll() {
        return paymentRepository.findAll();
    }
    
    public Optional<Payment> getById(Long id) {
        return paymentRepository.findById(id);
    }
    
    @Transactional
    public Payment addPayment(AddPaymentRequest request) {
        log.info("Enregistrement paiement pour {}, trimestre: {}, montant: {}", 
                request.getNumAffiliation(), request.getTrimestre(), request.getMontant());
        
        Payment payment = new Payment();
        payment.setNumAffiliation(request.getNumAffiliation());
        payment.setTrimestre(request.getTrimestre());
        payment.setMontant(request.getMontant());
        payment.setModePaiement(request.getModePaiement());
        payment.setPaiementPartiel(request.getPaiementPartiel());
        
        payment = paymentRepository.save(payment);
        log.info("Paiement enregistré, ID: {}", payment.getId());
        
        return payment;
    }
    
    @Transactional
    public Payment update(Long id, AddPaymentRequest request) {
        Payment payment = paymentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Paiement non trouvé: " + id));
        
        payment.setNumAffiliation(request.getNumAffiliation());
        payment.setTrimestre(request.getTrimestre());
        payment.setMontant(request.getMontant());
        payment.setModePaiement(request.getModePaiement());
        payment.setPaiementPartiel(request.getPaiementPartiel());
        
        return paymentRepository.save(payment);
    }
    
    @Transactional
    public void delete(Long id) {
        paymentRepository.deleteById(id);
    }
    
    @Transactional
    public Payment validate(Long id) {
        Payment payment = paymentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Paiement non trouvé: " + id));
        // Add validation logic here (e.g., set status to validated)
        return paymentRepository.save(payment);
    }
}
