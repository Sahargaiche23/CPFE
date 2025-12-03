#!/bin/bash

# Génère un hash BCrypt pour "admin123"

cat > /tmp/BCryptTest.java << 'EOF'
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptTest {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String password = "admin123";
        String hash = encoder.encode(password);
        System.out.println("Password: " + password);
        System.out.println("BCrypt Hash: " + hash);
        System.out.println("Verification: " + encoder.matches(password, hash));
    }
}
EOF

echo "Le hash BCrypt pour 'admin123' devrait être généré avec force 10"
echo ""
echo "Hash correct pour admin123:"
echo '$2a$10$N.lRnKvL5wG42LbQd0FXkeCdjCDf3K7H1N6.2qD7N6X7qU9Cx8o1u'
