package tn.cnss.cooperation.regime.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.regime.dto.DetermineRegimeRequest;
import tn.cnss.cooperation.regime.dto.RegimeResponse;
import tn.cnss.cooperation.regime.dto.RegimeCotisation;
import tn.cnss.cooperation.regime.service.RegimeService;

import java.util.List;

@RestController
@RequestMapping("/regime")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
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
    
    @GetMapping
    public ResponseEntity<List<RegimeCotisation>> getAllRegimes() {
        return ResponseEntity.ok(regimeService.getAllActiveRegimes());
    }
    
    @GetMapping("/all")
    public ResponseEntity<List<RegimeCotisation>> getAllIncludingInactive() {
        return ResponseEntity.ok(regimeService.getAllRegimes());
    }
    
    @PostMapping("/init")
    public ResponseEntity<String> initDefaultRegimes() {
        regimeService.initDefaultRegimes();
        return ResponseEntity.ok("Régimes initialisés avec succès");
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<RegimeCotisation> getById(@PathVariable Long id) {
        return ResponseEntity.ok(regimeService.getById(id));
    }
    
    @PostMapping
    public ResponseEntity<RegimeCotisation> create(@RequestBody RegimeCotisation regime) {
        return ResponseEntity.ok(regimeService.create(regime));
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<RegimeCotisation> update(@PathVariable Long id, @RequestBody RegimeCotisation regime) {
        return ResponseEntity.ok(regimeService.update(id, regime));
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        regimeService.delete(id);
        return ResponseEntity.ok().build();
    }
}
