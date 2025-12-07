package tn.cnss.cooperation.affiliation.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tn.cnss.cooperation.affiliation.service.ReportService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@RestController
@RequestMapping("/api/reports")
@CrossOrigin(origins = "*")
@RequiredArgsConstructor
public class ReportController {

    private final ReportService reportService;

    /**
     * Générer le rapport des affiliations au format PDF
     */
    @GetMapping("/affiliations")
    public ResponseEntity<byte[]> generateAffiliationsReport(
            @RequestParam(required = false, defaultValue = "TUNIS") String bureau,
            @RequestParam(required = false) String periode) {
        
        try {
            byte[] pdfContent = reportService.generateAffiliationsReport(bureau, periode);
            
            String filename = "rapport_affiliations_" + 
                    LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + ".pdf";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("attachment", filename);
            headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
            
            return new ResponseEntity<>(pdfContent, headers, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    /**
     * Générer le rapport des paiements au format PDF
     */
    @GetMapping("/paiements")
    public ResponseEntity<byte[]> generatePaiementsReport(
            @RequestParam(required = false, defaultValue = "TUNIS") String bureau,
            @RequestParam(required = false) String periode) {
        
        try {
            // TODO: Implémenter le rapport des paiements
            byte[] pdfContent = reportService.generateAffiliationsReport(bureau, periode);
            
            String filename = "rapport_paiements_" + 
                    LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + ".pdf";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("attachment", filename);
            
            return new ResponseEntity<>(pdfContent, headers, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    /**
     * Prévisualiser le rapport (inline)
     */
    @GetMapping("/affiliations/preview")
    public ResponseEntity<byte[]> previewAffiliationsReport(
            @RequestParam(required = false, defaultValue = "TUNIS") String bureau,
            @RequestParam(required = false) String periode) {
        
        try {
            byte[] pdfContent = reportService.generateAffiliationsReport(bureau, periode);
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.add("Content-Disposition", "inline; filename=rapport_affiliations.pdf");
            
            return new ResponseEntity<>(pdfContent, headers, HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
