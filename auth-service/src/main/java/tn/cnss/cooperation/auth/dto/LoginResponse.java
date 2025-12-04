package tn.cnss.cooperation.auth.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LoginResponse {
    private String token;
    private Long userId;
    private String username;
    private String identite;
    private String profil;
    private String burCod;
}
