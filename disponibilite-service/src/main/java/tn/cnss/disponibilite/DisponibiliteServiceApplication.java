package tn.cnss.disponibilite;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class DisponibiliteServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(DisponibiliteServiceApplication.class, args);
    }
}
