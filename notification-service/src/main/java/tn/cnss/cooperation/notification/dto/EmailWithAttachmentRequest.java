package tn.cnss.cooperation.notification.dto;

import lombok.Data;

@Data
public class EmailWithAttachmentRequest {
    private String to;
    private String subject;
    private String content;
    private String pdfBase64;
    private String fileName;
}
