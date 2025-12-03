package tn.cnss.cooperation.payment.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.payment.dto.AddPaymentRequest;
import tn.cnss.cooperation.payment.entity.Payment;
import tn.cnss.cooperation.payment.service.PaymentService;

@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class PaymentController {
    
    private final PaymentService paymentService;
    
    @PostMapping
    public ResponseEntity<Payment> addPayment(@RequestBody AddPaymentRequest request) {
        return ResponseEntity.ok(paymentService.addPayment(request));
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Payment Service is running");
    }
}
