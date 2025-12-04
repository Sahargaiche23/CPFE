package tn.cnss.cooperation.payment.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.payment.dto.AddPaymentRequest;
import tn.cnss.cooperation.payment.entity.Payment;
import tn.cnss.cooperation.payment.service.PaymentService;

import java.util.List;

@RestController
@RequestMapping("/payments")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class PaymentController {
    
    private final PaymentService paymentService;
    
    @GetMapping
    public ResponseEntity<List<Payment>> getAll() {
        return ResponseEntity.ok(paymentService.getAll());
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Payment> getById(@PathVariable Long id) {
        return paymentService.getById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping
    public ResponseEntity<Payment> addPayment(@RequestBody AddPaymentRequest request) {
        return ResponseEntity.ok(paymentService.addPayment(request));
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Payment> update(@PathVariable Long id, @RequestBody AddPaymentRequest request) {
        return ResponseEntity.ok(paymentService.update(id, request));
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        paymentService.delete(id);
        return ResponseEntity.noContent().build();
    }
    
    @PutMapping("/{id}/validate")
    public ResponseEntity<Payment> validate(@PathVariable Long id) {
        return ResponseEntity.ok(paymentService.validate(id));
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Payment Service is running");
    }
}
