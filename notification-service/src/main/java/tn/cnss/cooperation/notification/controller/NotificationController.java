package tn.cnss.cooperation.notification.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.notification.dto.EmailRequest;
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
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Notification Service is running");
    }
}
