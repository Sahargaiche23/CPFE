package tn.cnss.cooperation.file.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "ged_documents")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GedDocument {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ged_doc_seq")
    @SequenceGenerator(name = "ged_doc_seq", sequenceName = "GED_DOC_SEQ", allocationSize = 1)
    private Long id;
    
    @Column(nullable = false)
    private String titre;
    
    @Column(columnDefinition = "CLOB")
    private String description;
    
    @Column(nullable = false)
    private String fichierNom;
    
    @Column(nullable = false)
    private String fichierType;
    
    private Long fichierTaille;
    
    @Column(nullable = false)
    private String cheminFichier;
    
    @Column(nullable = false)
    private String categorie;
    
    @ElementCollection
    @CollectionTable(name = "ged_document_tags", joinColumns = @JoinColumn(name = "document_id"))
    @Column(name = "tag")
    private List<String> tags = new ArrayList<>();
    
    private Long parentId;
    
    @Column(nullable = false)
    private String creePar;
    
    @Column(nullable = false)
    private LocalDateTime dateCreation;
    
    private LocalDateTime dateModification;
    
    @PrePersist
    protected void onCreate() {
        dateCreation = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        dateModification = LocalDateTime.now();
    }
}
