package tn.cnss.disponibilite.dto;

import lombok.Data;

@Data
public class CotisationGenerationRequest {

    public enum ModeGeneration {
        TOUTES, INSTITUTION, AGENT
    }

    private ModeGeneration mode;
    private Integer trimestre;
    private Integer annee;
    private Long institutionId;
    private Long agentPublicId;
}
