package tn.cnss.cooperation.file.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tn.cnss.cooperation.file.entity.GedDocument;

import java.util.List;

@Repository
public interface GedDocumentRepository extends JpaRepository<GedDocument, Long> {
    
    List<GedDocument> findByCategorie(String categorie);
    
    @Query("SELECT d FROM GedDocument d WHERE LOWER(d.titre) LIKE LOWER(CONCAT('%', :search, '%')) OR LOWER(d.fichierNom) LIKE LOWER(CONCAT('%', :search, '%'))")
    List<GedDocument> searchByTitreOrNom(@Param("search") String search);
    
    @Query("SELECT d FROM GedDocument d WHERE d.categorie = :categorie AND (LOWER(d.titre) LIKE LOWER(CONCAT('%', :search, '%')) OR LOWER(d.fichierNom) LIKE LOWER(CONCAT('%', :search, '%')))")
    List<GedDocument> searchByCategorieAndTerm(@Param("categorie") String categorie, @Param("search") String search);
    
    List<GedDocument> findAllByOrderByDateCreationDesc();
    
    List<GedDocument> findByParentId(Long parentId);
    
    List<GedDocument> findByParentIdIsNullOrderByDateCreationDesc();
    
    @Query("SELECT SUM(d.fichierTaille) FROM GedDocument d")
    Long getTotalSize();
    
    @Query("SELECT d.categorie, COUNT(d) FROM GedDocument d WHERE d.parentId IS NULL GROUP BY d.categorie")
    List<Object[]> countByCategorie();

    @Query("SELECT COUNT(d) FROM GedDocument d WHERE d.parentId IS NULL")
    long countRootDocuments();
}
