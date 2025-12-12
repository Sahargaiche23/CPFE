package tn.cnss.cooperation.notification.dto;

import lombok.Data;

@Data
public class GenericEmailRequest {
    private String to;
    private String subject;
    private String content;
}
