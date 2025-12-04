package tn.cnss.cooperation.salary.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.salary.dto.ConvertSalaryRequest;
import tn.cnss.cooperation.salary.dto.SalaryConversionResponse;
import tn.cnss.cooperation.salary.service.SalaryService;

/**
 * Controller Salary Service
 * Endpoints avec paramètres multiples
 */
@RestController
@RequestMapping("/salary")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class SalaryController {
    
    private final SalaryService salaryService;
    
    /**
     * Convertir salaire étranger en TND
     * POST /salary/convert
     */
    @PostMapping("/convert")
    public ResponseEntity<SalaryConversionResponse> convertSalary(
            @Valid @RequestBody ConvertSalaryRequest request) {
        SalaryConversionResponse response = salaryService.convertSalary(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }
    
    /**
     * Récupérer le dernier salaire d'un dossier
     * GET /salary/last/{empMat}/{empCle}/{dateDebut}
     */
    @GetMapping("/last/{empMat}/{empCle}/{dateDebut}")
    public ResponseEntity<?> getLastSalary(
            @PathVariable Long empMat,
            @PathVariable Integer empCle,
            @PathVariable String dateDebut) {
        try {
            var salaire = salaryService.getLastSalary(empMat, empCle, java.time.LocalDate.parse(dateDebut));
            return ResponseEntity.ok(salaire);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Salary Service is running");
    }
}
