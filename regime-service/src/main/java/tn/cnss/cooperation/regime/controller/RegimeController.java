package tn.cnss.cooperation.regime.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.regime.dto.DetermineRegimeRequest;
import tn.cnss.cooperation.regime.dto.RegimeResponse;
import tn.cnss.cooperation.regime.service.RegimeService;

@RestController
@RequestMapping("/regime")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200")
public class RegimeController {
    
    private final RegimeService regimeService;
    
    @PostMapping("/determine")
    public ResponseEntity<RegimeResponse> determineRegime(@RequestBody DetermineRegimeRequest request) {
        return ResponseEntity.ok(regimeService.determineRegime(request));
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Regime Service is running");
    }
}
