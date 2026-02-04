package tn.cnss.cooperation.employer.reclamation;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "RECLAMATION")
@Data
public class Reclamation {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "EMAIL_COOPERANT", nullable = false)
    private String emailCooperant;
    
    @Column(name = "MOTIF", length = 1000)
    private String motif;
    
    @ElementCollection
    @CollectionTable(name = "RECLAMATION_DOCS_MANQUANTS", joinColumns = @JoinColumn(name = "RECLAMATION_ID"))
    @Column(name = "TYPE_DOCUMENT")
    private List<String> documentsManquants;
    
    @Column(name = "AGENT_ID")
    private Long agentId;
    
    @Column(name = "DATE_CREATION")
    private LocalDateTime dateCreation;
    
    @Column(name = "STATUT")
    private String statut; // EN_ATTENTE, CORRIGE, TRAITE
    
    @Column(name = "DATE_TRAITEMENT")
    private LocalDateTime dateTraitement;
    
    @Column(name = "COMMENTAIRE_COOPERANT", length = 1000)
    private String commentaireCooperant;
    
    @PrePersist
    public void prePersist() {
        this.dateCreation = LocalDateTime.now();
        this.statut = "EN_ATTENTE";
    }
}
