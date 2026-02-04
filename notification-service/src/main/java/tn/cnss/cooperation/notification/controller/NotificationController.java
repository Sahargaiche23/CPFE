package tn.cnss.cooperation.notification.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.notification.dto.AtctRappelRequest;
import tn.cnss.cooperation.notification.dto.DebitEmailRequest;
import tn.cnss.cooperation.notification.dto.EmailRequest;
import tn.cnss.cooperation.notification.dto.EmailWithAttachmentRequest;
import tn.cnss.cooperation.notification.dto.GenericEmailRequest;
import tn.cnss.cooperation.notification.service.EmailService;

@RestController
@RequestMapping("/notification")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class NotificationController {
    
    private final EmailService emailService;
    
    @PostMapping("/affiliation")
    public ResponseEntity<String> sendAffiliationEmail(@RequestBody EmailRequest request) {
        emailService.sendAffiliationEmail(request);
        return ResponseEntity.ok("Email envoyé");
    }

    @PostMapping("/email")
    public ResponseEntity<String> sendEmail(@RequestBody GenericEmailRequest request) {
        emailService.sendGenericEmail(request.getTo(), request.getSubject(), request.getContent());
        return ResponseEntity.ok("Email envoyé");
    }
    
    @PostMapping("/email-with-attachment")
    public ResponseEntity<String> sendEmailWithAttachment(@RequestBody EmailWithAttachmentRequest request) {
        emailService.sendEmailWithAttachment(
            request.getTo(), 
            request.getSubject(), 
            request.getContent(), 
            request.getPdfBase64(), 
            request.getFileName()
        );
        return ResponseEntity.ok("Email avec pièce jointe envoyé");
    }

    @PostMapping("/debit-email")
    public ResponseEntity<String> sendDebitEmail(@RequestBody DebitEmailRequest request) {
        emailService.sendDebitEmailWithPdf(
            request.getTo(),
            request.getSubject(),
            request.getNumAffiliation(),
            request.getMatricule(),
            request.getNomCooperant(),
            request.getAdresse(),
            request.getTrimestre(),
            request.getAnnee(),
            request.getSalaire(),
            request.getMontantTotal()
        );
        return ResponseEntity.ok("Email avec PDF envoyé");
    }

    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Notification Service is running");
    }

    @PostMapping("/atct-rappel")
    public ResponseEntity<String> sendAtctRappel(@RequestBody AtctRappelRequest request) {
        emailService.sendAtctRappelWithPdf(request);
        return ResponseEntity.ok("Rappel ATCT avec PDF envoyé");
    }

    @PostMapping("/atct-rappel-pdf")
    public ResponseEntity<String> sendAtctRappelAvecPdf(@RequestBody java.util.Map<String, String> request) {
        emailService.sendEmailWithAttachment(
            request.get("to"),
            request.get("subject"),
            request.get("content"),
            request.get("pdfBase64"),
            "Formulaire_ATCT.pdf"
        );
        return ResponseEntity.ok("Rappel ATCT avec PDF bilingue envoyé");
    }
}
