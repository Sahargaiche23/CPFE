package tn.cnss.cooperation.employer.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tn.cnss.cooperation.employer.dto.EmployeurDTO;
import tn.cnss.cooperation.employer.entity.Employeur;
import tn.cnss.cooperation.employer.entity.EmployeurId;
import tn.cnss.cooperation.employer.repository.EmployeurRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployeurService {
    
    private final EmployeurRepository employeurRepository;
    
    @Transactional(readOnly = true)
    public List<EmployeurDTO> getAll() {
        return employeurRepository.findAll().stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }
    
    @Transactional(readOnly = true)
    public EmployeurDTO getById(Long empMat, Integer empCle) {
        return employeurRepository.findById(new EmployeurId(empMat, empCle))
                .map(this::toDTO)
                .orElseThrow(() -> new RuntimeException("Employeur non trouvé"));
    }
    
    @Transactional(readOnly = true)
    public List<EmployeurDTO> searchByName(String search) {
        return employeurRepository.search(search).stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }
    
    @Transactional(readOnly = true)
    public List<EmployeurDTO> filterByRegime(String regime) {
        return employeurRepository.findByRegime(regime).stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }
    
    @Transactional(readOnly = true)
    public List<EmployeurDTO> filterByStatut(String statut) {
        return employeurRepository.findByStatut(statut).stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }
    
    @Transactional
    public EmployeurDTO create(EmployeurDTO dto) {
        Employeur employeur = toEntity(dto);
        
        // Auto-générer empMat et empCle si non fournis
        if (employeur.getEmpMat() == null || employeur.getEmpMat() == 0) {
            Long maxMat = employeurRepository.findMaxEmpMat();
            employeur.setEmpMat(maxMat != null ? maxMat + 1 : 500001L);
        }
        if (employeur.getEmpCle() == null || employeur.getEmpCle() == 0) {
            employeur.setEmpCle(54); // Clé par défaut
        }
        
        employeur.setDateCreation(LocalDate.now());
        employeur.setStatut("Actif");
        
        log.info("Création employeur: empMat={}, empCle={}", employeur.getEmpMat(), employeur.getEmpCle());
        
        Employeur saved = employeurRepository.save(employeur);
        return toDTO(saved);
    }
    
    @Transactional
    public EmployeurDTO update(Long empMat, Integer empCle, EmployeurDTO dto) {
        Employeur employeur = employeurRepository.findById(new EmployeurId(empMat, empCle))
                .orElseThrow(() -> new RuntimeException("Employeur non trouvé"));
        
        employeur.setNomCommercial(dto.getNomCommercial());
        employeur.setRaisonSociale(dto.getRaisonSociale());
        employeur.setRegime(dto.getRegime());
        employeur.setPays(dto.getPays());
        employeur.setAdresse(dto.getAdresse());
        employeur.setTelephone(dto.getTelephone());
        employeur.setEmail(dto.getEmail());
        employeur.setStatut(dto.getStatut());
        
        Employeur updated = employeurRepository.save(employeur);
        return toDTO(updated);
    }
    
    @Transactional
    public void delete(Long empMat, Integer empCle) {
        employeurRepository.deleteById(new EmployeurId(empMat, empCle));
    }
    
    private EmployeurDTO toDTO(Employeur employeur) {
        Long affiliations = employeurRepository.countAffiliations(
            employeur.getEmpMat(), 
            employeur.getEmpCle()
        );
        
        return EmployeurDTO.builder()
                .id(employeur.getEmpMat() + "-" + employeur.getEmpCle())
                .empMat(employeur.getEmpMat())
                .empCle(employeur.getEmpCle())
                .matriculeComplet(employeur.getMatriculeComplet())
                .nomCommercial(employeur.getNomCommercial())
                .raisonSociale(employeur.getRaisonSociale())
                .regime(employeur.getRegime())
                .pays(employeur.getPays())
                .adresse(employeur.getAdresse())
                .telephone(employeur.getTelephone())
                .email(employeur.getEmail())
                .statut(employeur.getStatut())
                .dateCreation(employeur.getDateCreation() != null ? employeur.getDateCreation().toString() : null)
                .affiliations(affiliations)
                .build();
    }
    
    private Employeur toEntity(EmployeurDTO dto) {
        Employeur employeur = new Employeur();
        employeur.setEmpMat(dto.getEmpMat());
        employeur.setEmpCle(dto.getEmpCle());
        employeur.setNomCommercial(dto.getNomCommercial());
        employeur.setRaisonSociale(dto.getRaisonSociale());
        employeur.setRegime(dto.getRegime());
        employeur.setPays(dto.getPays());
        employeur.setAdresse(dto.getAdresse());
        employeur.setTelephone(dto.getTelephone());
        employeur.setEmail(dto.getEmail());
        employeur.setStatut(dto.getStatut());
        return employeur;
    }
}
