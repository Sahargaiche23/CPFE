package tn.cnss.cooperation.auth.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.auth.dto.LoginRequest;
import tn.cnss.cooperation.auth.dto.LoginResponse;
import tn.cnss.cooperation.auth.service.AuthService;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class AuthController {
    
    private final AuthService authService;
    
    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request) {
        LoginResponse response = authService.login(request);
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/health")
    public ResponseEntity<String> health() {
        return ResponseEntity.ok("Auth Service is running");
    }
    
    @GetMapping("/debug/{username}")
    public ResponseEntity<?> debug(@PathVariable String username) {
        return ResponseEntity.ok(authService.findUser(username));
    }
}
