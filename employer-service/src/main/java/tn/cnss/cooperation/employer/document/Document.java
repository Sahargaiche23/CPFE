package tn.cnss.cooperation.employer.document;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "documents")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Document {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String nomFichier;
    
    @Column(nullable = false)
    private String nomOriginal;
    
    @Column(nullable = false)
    private String typeDocument; // identite, contrat, diplome, attestation, autres
    
    @Column(nullable = false)
    private String mimeType;
    
    private Long tailleFichier;
    
    @Column(nullable = false)
    private String cheminStockage;
    
    private String emailCooperant;
    
    private Long cooperantId;
    
    @Column(nullable = false)
    private LocalDateTime dateUpload;
    
    @Enumerated(EnumType.STRING)
    private StatutDocument statut;
    
    public enum StatutDocument {
        EN_ATTENTE,
        VALIDE,
        REJETE
    }
}
