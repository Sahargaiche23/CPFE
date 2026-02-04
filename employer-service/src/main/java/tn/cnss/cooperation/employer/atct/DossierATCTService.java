package tn.cnss.cooperation.employer.atct;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class DossierATCTService {

    private final DossierATCTRepository repository;
    private final RestTemplate restTemplate;
    
    @Value("${notification.service.url:http://localhost:8087}")
    private String notificationServiceUrl;
    
    @Value("${auth.service.url:http://localhost:8089}")
    private String authServiceUrl;
    
    private static final String CHARS = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789";
    private static final SecureRandom RANDOM = new SecureRandom();

    public List<DossierATCT> findAll() {
        return repository.findByActifTrueOrderByDateCreationDesc();
    }

    public DossierATCT findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dossier ATCT non trouvé: " + id));
    }

    public List<DossierATCT> findByStatut(String statut) {
        return repository.findByStatutAndActifTrue(statut);
    }

    public List<DossierATCT> findEnAttente() {
        return repository.findEnAttente();
    }

    public List<DossierATCT> findPourAffiliation() {
        return repository.findPourAffiliation();
    }

    public List<DossierATCT> search(String query) {
        return repository.search(query);
    }

    public Map<String, Long> getStats() {
        Map<String, Long> stats = new HashMap<>();
        stats.put("total", repository.countTotal());
        stats.put("en_attente", repository.countEnAttente());
        stats.put("valides", repository.countValides());
        stats.put("rejetes", repository.countRejetes());
        return stats;
    }

    @Transactional
    public DossierATCT create(DossierATCT dossier, Long agentId) {
        dossier.setCreePar(agentId);
        dossier.setStatut("EN_ATTENTE");
        dossier.setActif(true);
        dossier.setDateCreation(LocalDateTime.now());
        log.info("Création dossier ATCT pour {} {} par agent {}", dossier.getNomFr(), dossier.getPrenomFr(), agentId);
        return repository.save(dossier);
    }

    @Transactional
    public DossierATCT update(Long id, DossierATCT updates, Long agentId) {
        DossierATCT dossier = findById(id);
        
        // Update fields
        dossier.setNumSecuSociale(updates.getNumSecuSociale());
        dossier.setNomFr(updates.getNomFr());
        dossier.setPrenomFr(updates.getPrenomFr());
        dossier.setNomAr(updates.getNomAr());
        dossier.setPrenomAr(updates.getPrenomAr());
        dossier.setDateNaissance(updates.getDateNaissance());
        dossier.setLieuNaissanceFr(updates.getLieuNaissanceFr());
        dossier.setSexe(updates.getSexe());
        dossier.setNationalite(updates.getNationalite());
        dossier.setNumCin(updates.getNumCin());
        dossier.setNumPasseport(updates.getNumPasseport());
        dossier.setAdresseTunisie(updates.getAdresseTunisie());
        dossier.setCodePostalTunisie(updates.getCodePostalTunisie());
        dossier.setVilleTunisie(updates.getVilleTunisie());
        dossier.setAdresseEtranger(updates.getAdresseEtranger());
        dossier.setCodePostalEtranger(updates.getCodePostalEtranger());
        dossier.setVilleEtranger(updates.getVilleEtranger());
        dossier.setPaysEtranger(updates.getPaysEtranger());
        dossier.setPaysCode(updates.getPaysCode());
        dossier.setTelephone(updates.getTelephone());
        dossier.setEmail(updates.getEmail());
        dossier.setEtablissementOrigine(updates.getEtablissementOrigine());
        dossier.setMatriculeEmployeur(updates.getMatriculeEmployeur());
        dossier.setCleEmployeur(updates.getCleEmployeur());
        dossier.setOrganismeEtranger(updates.getOrganismeEtranger());
        dossier.setMissionPoste(updates.getMissionPoste());
        dossier.setDateDebutDetachement(updates.getDateDebutDetachement());
        dossier.setDateFinDetachement(updates.getDateFinDetachement());
        dossier.setDateRenouvellement(updates.getDateRenouvellement());
        dossier.setSalaireTunisie(updates.getSalaireTunisie());
        dossier.setSalaireEtranger(updates.getSalaireEtranger());
        dossier.setDeviseEtranger(updates.getDeviseEtranger());
        dossier.setSalaireConvertiTnd(updates.getSalaireConvertiTnd());
        dossier.setModePaiement(updates.getModePaiement());
        dossier.setPaiementAnticipe(updates.getPaiementAnticipe());
        dossier.setCodeRegime(updates.getCodeRegime());
        dossier.setAssuranceMaladie(updates.getAssuranceMaladie());
        dossier.setCapitalDeces(updates.getCapitalDeces());
        dossier.setDateEffetAssurance(updates.getDateEffetAssurance());
        dossier.setModifiePar(agentId);
        dossier.setDateModification(LocalDateTime.now());
        
        return repository.save(dossier);
    }

    @Transactional
    public DossierATCT valider(Long id, Long agentId) {
        DossierATCT dossier = findById(id);
        dossier.setStatut("VALIDE");
        dossier.setDateValidation(LocalDateTime.now());
        dossier.setValidePar(agentId);
        
        // Générer mot de passe temporaire
        String tempPassword = generateTempPassword();
        dossier.setMotDePasseTemp(tempPassword);
        
        // Créer le compte utilisateur dans auth-service
        boolean compteCree = createUserAccount(dossier, tempPassword);
        dossier.setCompteCree(compteCree);
        
        log.info("Dossier {} validé par agent {}, compte créé: {}", id, agentId, compteCree);
        
        // Envoyer email avec identifiants
        DossierATCT savedDossier = repository.save(dossier);
        if (compteCree) {
            sendWelcomeEmail(savedDossier, tempPassword);
        }
        
        return savedDossier;
    }
    
    private boolean createUserAccount(DossierATCT dossier, String password) {
        try {
            String url = authServiceUrl + "/api/users";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            Map<String, Object> body = new HashMap<>();
            body.put("username", dossier.getEmail());
            body.put("password", password);
            body.put("email", dossier.getEmail());
            body.put("firstName", dossier.getPrenomFr());
            body.put("lastName", dossier.getNomFr());
            body.put("profil", "COOPERANT");
            
            HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(url, request, String.class);
            
            log.info("Compte utilisateur créé pour {}", dossier.getEmail());
            return true;
        } catch (Exception e) {
            log.error("Erreur création compte pour {} : {}", dossier.getEmail(), e.getMessage());
            return false;
        }
    }

    @Transactional
    public DossierATCT rejeter(Long id, String motif, Long agentId) {
        DossierATCT dossier = findById(id);
        dossier.setStatut("REJETE");
        dossier.setMotifRejet(motif);
        dossier.setDateValidation(LocalDateTime.now());
        dossier.setValidePar(agentId);
        
        log.info("Dossier {} rejeté par agent {} - Motif: {}", id, agentId, motif);
        return repository.save(dossier);
    }

    @Transactional
    public DossierATCT marquerDocumentsDeposes(Long id) {
        DossierATCT dossier = findById(id);
        dossier.setDocumentsDeposes(true);
        dossier.setDateDepotDocuments(LocalDateTime.now());
        return repository.save(dossier);
    }

    @Transactional
    public DossierATCT lierAffiliation(Long id, Long affiliationId, String numAffiliation) {
        DossierATCT dossier = findById(id);
        dossier.setAffiliationId(affiliationId);
        dossier.setNumAffiliation(numAffiliation);
        dossier.setStatut("AFFILIE");
        return repository.save(dossier);
    }

    @Transactional
    public void delete(Long id) {
        DossierATCT dossier = findById(id);
        dossier.setActif(false);
        repository.save(dossier);
    }

    private String generateTempPassword() {
        StringBuilder sb = new StringBuilder(10);
        for (int i = 0; i < 10; i++) {
            sb.append(CHARS.charAt(RANDOM.nextInt(CHARS.length())));
        }
        return sb.toString();
    }
    
    @Transactional
    public DossierATCT envoyerEmail(Long id) {
        DossierATCT dossier = findById(id);
        String tempPassword = dossier.getMotDePasseTemp();
        if (tempPassword == null) {
            tempPassword = generateTempPassword();
            dossier.setMotDePasseTemp(tempPassword);
        }
        sendWelcomeEmail(dossier, tempPassword);
        return repository.save(dossier);
    }

    @Transactional
    public DossierATCT envoyerRappel(Long id) {
        DossierATCT dossier = findById(id);
        sendRappelEmail(dossier);
        return dossier;
    }

    @Transactional
    public DossierATCT envoyerRappelAvecPdf(Long id, String pdfBase64) {
        DossierATCT dossier = findById(id);
        sendRappelEmailAvecPdf(dossier, pdfBase64);
        return dossier;
    }

    private void sendRappelEmailAvecPdf(DossierATCT dossier, String pdfBase64) {
        try {
            String url = notificationServiceUrl + "/notification/atct-rappel-pdf";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            String content = "Bonjour " + dossier.getPrenomFr() + " " + dossier.getNomFr() + ",\n\n" +
                "Ceci est un rappel concernant votre dossier de coopération technique (ATCT).\n\n" +
                "Veuillez trouver ci-joint le formulaire officiel CNSS bilingue (FR/AR) à remplir et à déposer.\n\n" +
                "Vos identifiants de connexion :\n" +
                "- Email : " + dossier.getEmail() + "\n" +
                "- Mot de passe : " + dossier.getMotDePasseTemp() + "\n\n" +
                "Connectez-vous sur : http://localhost:4200\n\n" +
                "Cordialement,\n" +
                "CNSS - Caisse Nationale de Sécurité Sociale";
            
            Map<String, Object> body = new HashMap<>();
            body.put("to", dossier.getEmail());
            body.put("subject", "CNSS - Rappel Dossier ATCT N°" + dossier.getId() + " - Formulaire bilingue");
            body.put("content", content);
            body.put("pdfBase64", pdfBase64);
            
            HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(url, request, String.class);
            
            log.info("Rappel avec PDF bilingue envoyé à {} pour le dossier {}", dossier.getEmail(), dossier.getId());
        } catch (Exception e) {
            log.error("Erreur lors de l'envoi du rappel à {} : {}", dossier.getEmail(), e.getMessage());
        }
    }

    private void sendRappelEmail(DossierATCT dossier) {
        try {
            String url = notificationServiceUrl + "/notification/atct-rappel";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            String content = "Bonjour " + dossier.getPrenomFr() + " " + dossier.getNomFr() + ",\n\n" +
                "Ceci est un rappel concernant votre dossier de coopération technique (ATCT).\n\n" +
                "Veuillez trouver ci-joint le formulaire officiel CNSS à remplir et à déposer.\n\n" +
                "Vos identifiants de connexion :\n" +
                "- Email : " + dossier.getEmail() + "\n" +
                "- Mot de passe : " + dossier.getMotDePasseTemp() + "\n\n" +
                "Connectez-vous sur : http://localhost:4200\n\n" +
                "Cordialement,\n" +
                "CNSS - Caisse Nationale de Sécurité Sociale";
            
            Map<String, Object> body = new HashMap<>();
            body.put("to", dossier.getEmail());
            body.put("subject", "CNSS - Rappel Dossier ATCT N°" + dossier.getId() + " - Formulaire à déposer");
            body.put("content", content);
            body.put("nomComplet", dossier.getNomFr() + " " + dossier.getPrenomFr());
            body.put("nomCompletAr", dossier.getNomAr() != null && dossier.getPrenomAr() != null ? 
                dossier.getNomAr() + " " + dossier.getPrenomAr() : null);
            body.put("numSecuSociale", dossier.getNumSecuSociale());
            body.put("adresseTunisie", dossier.getAdresseTunisie());
            body.put("codePostalTunisie", dossier.getCodePostalTunisie());
            body.put("villeTunisie", dossier.getVilleTunisie());
            body.put("adresseEtranger", dossier.getAdresseEtranger());
            body.put("villeEtranger", dossier.getVilleEtranger());
            body.put("paysEtranger", dossier.getPaysEtranger());
            body.put("email", dossier.getEmail());
            body.put("etablissementOrigine", dossier.getEtablissementOrigine());
            body.put("organismeEtranger", dossier.getOrganismeEtranger());
            body.put("dateDebutDetachement", dossier.getDateDebutDetachement() != null ? dossier.getDateDebutDetachement().toString() : null);
            body.put("dateFinDetachement", dossier.getDateFinDetachement() != null ? dossier.getDateFinDetachement().toString() : null);
            body.put("modePaiement", dossier.getModePaiement());
            body.put("assuranceMaladie", dossier.getAssuranceMaladie());
            
            HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(url, request, String.class);
            
            log.info("Rappel avec PDF envoyé à {} pour le dossier {}", dossier.getEmail(), dossier.getId());
        } catch (Exception e) {
            log.error("Erreur lors de l'envoi du rappel à {} : {}", dossier.getEmail(), e.getMessage());
        }
    }
    
    private String generateFormulaireCnssPdf(DossierATCT d) {
        String dateNow = java.time.LocalDate.now().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String html = String.format("""
            <!DOCTYPE html>
            <html lang="ar" dir="rtl">
            <head>
                <meta charset="UTF-8">
                <style>
                    @page { size: A4; margin: 1cm; }
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body { font-family: 'Traditional Arabic', 'Times New Roman', serif; font-size: 12px; direction: rtl; padding: 15px; line-height: 1.6; }
                    .header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 10px; border-bottom: 1px solid #000; padding-bottom: 10px; }
                    .header-left { text-align: left; font-size: 10px; direction: ltr; flex: 1; }
                    .header-center { text-align: center; flex: 1; }
                    .header-center img { width: 60px; height: auto; }
                    .header-right { text-align: right; font-size: 11px; flex: 1; }
                    .title-box { border: 2px solid #000; padding: 8px; text-align: center; margin: 10px 0; background: #f5f5f5; }
                    .title { font-size: 16px; font-weight: bold; }
                    .subtitle { font-size: 11px; margin-top: 3px; }
                    .form-row { display: flex; margin: 6px 0; align-items: baseline; }
                    .form-label { font-weight: bold; margin-left: 5px; white-space: nowrap; }
                    .form-value { border-bottom: 1px dotted #000; flex: 1; padding: 0 5px; min-height: 16px; }
                    .form-value.filled { font-weight: bold; color: #000080; }
                    .section { margin: 12px 0; }
                    .section-content { padding: 8px; border: 1px solid #999; margin-top: 5px; }
                    .checkbox-line { margin: 8px 0; display: flex; align-items: center; }
                    .checkbox { display: inline-block; width: 14px; height: 14px; border: 1.5px solid #000; margin-left: 8px; text-align: center; line-height: 12px; font-weight: bold; }
                    .checkbox.checked::after { content: "✓"; }
                    .two-cols { display: flex; gap: 20px; }
                    .col { flex: 1; }
                    .commitment { margin: 15px 0; padding: 10px; background: #fffde7; border: 1px solid #ffc107; font-size: 11px; line-height: 1.8; }
                    .signature-section { margin-top: 20px; display: flex; justify-content: space-between; }
                    .signature-box { text-align: center; }
                    .footer { margin-top: 15px; font-size: 9px; text-align: center; border-top: 2px solid #000; padding-top: 8px; }
                    .footer-ar { margin-bottom: 3px; }
                    .ref-box { position: absolute; top: 10px; left: 10px; font-size: 9px; direction: ltr; }
                </style>
            </head>
            <body>
                <div class="ref-box">PM54</div>
                
                <div class="header">
                    <div class="header-left">
                        <strong>République Tunisienne</strong><br>
                        Ministère des Affaires Sociales,<br>
                        de la Solidarité<br>
                        et des Tunisiens à l'Étranger<br><br>
                        <strong>Caisse Nationale<br>de Sécurité Sociale</strong>
                    </div>
                    <div class="header-center">
                        <div style="font-size: 40px;">🏛️</div>
                    </div>
                    <div class="header-right">
                        وزارة الشؤون الاجتماعية والتضامن<br>
                        والتونسيين بالخارج<br><br>
                        <strong>الصندوق الوطني للضمان الاجتماعي</strong>
                    </div>
                </div>
                
                <div class="title-box">
                    <div class="title">تسوية فترات الإلحاق في إطار التعاون الفني</div>
                    <div class="subtitle">الفصل 6 من الأمر عدد 1879 لسنة 2007 المؤرخ في 23 جويلية 2007</div>
                </div>
                
                <div class="form-row">
                    <span class="form-label">إلى السيد(ة) :</span>
                    <span class="form-value filled">مدير الصندوق الوطني للضمان الاجتماعي</span>
                </div>
                
                <div class="section">
                    <div class="two-cols">
                        <div class="col">
                            <div class="form-row">
                                <span class="form-label">- الإسم و اللقب :</span>
                                <span class="form-value filled">%s %s</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">- العنوان الشخصي بتونس :</span>
                                <span class="form-value filled">%s %s %s</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">- العنوان الإلكتروني :</span>
                                <span class="form-value filled">%s</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">- المؤسسة المشغلة الأصلية بتونس :</span>
                                <span class="form-value filled">%s</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">- بداية الإلحاق (1) :</span>
                                <span class="form-value filled">%s</span>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-row">
                                <span class="form-label">المضمون الاجتماعي رقم :</span>
                                <span class="form-value filled">%s</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">الرقم البريدي :</span>
                                <span class="form-value filled">%s</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">- العنوان الشخصي بالخارج :</span>
                                <span class="form-value filled">%s %s - %s</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">- الهيئة الأصلية :</span>
                                <span class="form-value filled">%s</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">تجديد الإلحاق - نهاية الإلحاق (1) :</span>
                                <span class="form-value filled">%s</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="commitment">
                    <p>ألتزم بتسوية وضعيتي إزاء نظام التقاعد و العجز خلال فترة الإلحاق للعمل في إطار التعاون الفني المبينة أعلاه حسب الطريقة التالية لدفع مبلغ المساهمات المستوجبة بهذا العنوان لفائدة الصندوق الوطني للضمان الاجتماعي (2) :</p>
                </div>
                
                <div class="section">
                    <div style="display: flex; justify-content: space-around; flex-wrap: wrap;">
                        <div class="checkbox-line">
                            <span class="checkbox %s"></span>
                            <span>مسبقا و قبل حلول أجلها</span>
                        </div>
                        <div class="checkbox-line">
                            <span class="checkbox %s"></span>
                            <span>بصفة دورية مرة في نهاية كل ثلاثة أشهر</span>
                        </div>
                        <div class="checkbox-line">
                            <span class="checkbox %s"></span>
                            <span>بصفة دورية مرة في نهاية كل سنة</span>
                        </div>
                        <div class="checkbox-line">
                            <span class="checkbox %s"></span>
                            <span>شهريا</span>
                        </div>
                    </div>
                </div>
                
                <div class="section">
                    <div class="checkbox-line">
                        <span class="checkbox %s"></span>
                        <span>أرغب في الإنتفاع بنظام الحيطة الإجتماعية (تغطية صحية في تونس و نظام رأس المال عند الوفاة) على نظرائي المباشرين بتونس و ذلك بداية من ../../.... والتزم بدفع مبلغ المساهمات المستوجبة بهذا العنوان حسب نفس الطريقة (2).</span>
                    </div>
                    <div class="checkbox-line" style="margin-top: 10px;">
                        <span class="checkbox"></span>
                        <span>لا أرغب في مواصلة الإنتفاع بنظام الحيطة الإجتماعية المنطبق على نظرائي المباشرين بتونس (2).</span>
                    </div>
                </div>
                
                <div class="signature-section">
                    <div class="signature-box">
                        <p>حررت في .................. في %s</p>
                        <p style="margin-top: 40px;"><strong>الإمضاء</strong></p>
                    </div>
                </div>
                
                <div style="margin-top: 20px; font-size: 9px; border-top: 1px dashed #000; padding-top: 5px;">
                    <p>(1) فتر اليوم و الشهر و السنة</p>
                    <p>(2) ضع علامة X في المربع الموافق</p>
                </div>
                
                <div class="footer">
                    <div class="footer-ar">المقر الإجتماعي : 49 شارع الطيب المهيري - 1002 تونس البلفيدير - هاتف: 71 796 744 (216) - تيلفاكس: 14063</div>
                    <div>Siège social : 49, Avenue Taïeb MHIRI - 1002 Tunis Belvédère - Tél: (216) 71 796 744-LG - Telex: 14063</div>
                    <div style="margin-top: 5px;">Adresse E-Mail : CNSS.DCGCT</div>
                </div>
            </body>
            </html>
            """,
            d.getNomFr() != null ? d.getNomFr() : "", 
            d.getPrenomFr() != null ? d.getPrenomFr() : "",
            d.getAdresseTunisie() != null ? d.getAdresseTunisie() : "",
            d.getCodePostalTunisie() != null ? d.getCodePostalTunisie() : "",
            d.getVilleTunisie() != null ? d.getVilleTunisie() : "",
            d.getEmail() != null ? d.getEmail() : "",
            d.getEtablissementOrigine() != null ? d.getEtablissementOrigine() : "",
            d.getDateDebutDetachement() != null ? d.getDateDebutDetachement().toString() : "",
            d.getNumSecuSociale() != null ? d.getNumSecuSociale() : "",
            d.getCodePostalTunisie() != null ? d.getCodePostalTunisie() : "",
            d.getAdresseEtranger() != null ? d.getAdresseEtranger() : "",
            d.getVilleEtranger() != null ? d.getVilleEtranger() : "",
            d.getPaysEtranger() != null ? d.getPaysEtranger() : "",
            d.getOrganismeEtranger() != null ? d.getOrganismeEtranger() : "",
            d.getDateFinDetachement() != null ? d.getDateFinDetachement().toString() : "En cours",
            "ANTICIPE".equals(d.getModePaiement()) ? "checked" : "",
            "TRIMESTRIEL".equals(d.getModePaiement()) ? "checked" : "",
            "ANNUEL".equals(d.getModePaiement()) ? "checked" : "",
            "MENSUEL".equals(d.getModePaiement()) ? "checked" : "",
            Boolean.TRUE.equals(d.getAssuranceMaladie()) ? "checked" : "",
            dateNow
        );
        
        return java.util.Base64.getEncoder().encodeToString(html.getBytes(java.nio.charset.StandardCharsets.UTF_8));
    }

    private void sendWelcomeEmail(DossierATCT dossier, String tempPassword) {
        try {
            String url = notificationServiceUrl + "/notification/email";
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            String content = String.format(
                "<html><body style='font-family: Arial, sans-serif;'>" +
                "<h2 style='color: #1a365d;'>Bienvenue sur la plateforme CNSS - Coopération Technique</h2>" +
                "<p>Bonjour <strong>%s %s</strong>,</p>" +
                "<p>Votre dossier ATCT a été validé avec succès.</p>" +
                "<p>Voici vos identifiants de connexion :</p>" +
                "<div style='background: #f0f4f8; padding: 15px; border-radius: 8px; margin: 20px 0;'>" +
                "<p><strong>Email :</strong> %s</p>" +
                "<p><strong>Mot de passe temporaire :</strong> %s</p>" +
                "</div>" +
                "<p style='color: #e53e3e;'>⚠️ Veuillez changer votre mot de passe lors de votre première connexion.</p>" +
                "<p>Connectez-vous sur : <a href='http://localhost:4200'>http://localhost:4200</a></p>" +
                "<hr style='margin: 20px 0;'>" +
                "<p style='color: #718096; font-size: 12px;'>CNSS - Caisse Nationale de Sécurité Sociale</p>" +
                "</body></html>",
                dossier.getPrenomFr(), dossier.getNomFr(),
                dossier.getEmail(), tempPassword
            );
            
            Map<String, String> body = new HashMap<>();
            body.put("to", dossier.getEmail());
            body.put("subject", "CNSS - Validation de votre dossier ATCT - Identifiants de connexion");
            body.put("content", content);
            
            HttpEntity<Map<String, String>> request = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(url, request, String.class);
            
            dossier.setEmailEnvoye(true);
            dossier.setDateEnvoiEmail(LocalDateTime.now());
            repository.save(dossier);
            
            log.info("Email envoyé à {} pour le dossier {}", dossier.getEmail(), dossier.getId());
        } catch (Exception e) {
            log.error("Erreur lors de l'envoi de l'email à {} : {}", dossier.getEmail(), e.getMessage());
        }
    }
}
