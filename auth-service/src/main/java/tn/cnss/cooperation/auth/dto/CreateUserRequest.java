package tn.cnss.cooperation.auth.dto;

import lombok.Data;

@Data
public class CreateUserRequest {
    private String username;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String profil;  // admin, user
    private String burCode;
    private Integer govCode;
}
