package tn.cnss.disponibilite.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "DISP_DOCUMENT_GED", schema = "COPT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocumentGed {

    public enum TypeDocument {
        DECLARATION, ATTESTATION_SALAIRE, MOGARER_IAALEM, ARRETE_DISPONIBILITE, CIN, AUTRE
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "disp_doc_seq")
    @SequenceGenerator(name = "disp_doc_seq", sequenceName = "DISP_DOCUMENT_GED_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "AGENT_PUBLIC_ID", nullable = false)
    private AgentPublic agentPublic;

    @Enumerated(EnumType.STRING)
    @Column(name = "TYPE_DOCUMENT", length = 50, nullable = false)
    private TypeDocument typeDocument;

    @Column(name = "NOM_FICHIER", length = 255)
    private String nomFichier;

    @Column(name = "CHEMIN_FICHIER", length = 500)
    private String cheminFichier;

    @Column(name = "CONTENT_TYPE", length = 100)
    private String contentType;

    @Column(name = "TAILLE")
    private Long taille;

    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
