package tn.cnss.cooperation.auth.dto;

import lombok.Data;

@Data
public class UpdateUserRequest {
    private String email;
    private String firstName;
    private String lastName;
    private String profil;
    private String burCode;
    private Integer govCode;
    private Integer active;
}
