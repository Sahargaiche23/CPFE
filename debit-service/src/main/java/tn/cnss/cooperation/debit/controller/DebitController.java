package tn.cnss.cooperation.debit.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.debit.dto.GenerateDebitRequest;
import tn.cnss.cooperation.debit.entity.Debit;
import tn.cnss.cooperation.debit.service.DebitService;

@RestController
@RequestMapping("/debit")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class DebitController {
    
    private final DebitService debitService;
    
    @PostMapping("/generate")
    public ResponseEntity<Debit> generateDebit(@RequestBody GenerateDebitRequest request) {
        Debit debit = debitService.generateDebit(request);
        return ResponseEntity.ok(debit);
    }
    
    @GetMapping
    public ResponseEntity<Debit> getDebit(
            @RequestParam String numAffiliation,
            @RequestParam String trimestre) {
        return ResponseEntity.ok(debitService.getDebit(numAffiliation, trimestre));
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Debit Service is running");
    }
}
