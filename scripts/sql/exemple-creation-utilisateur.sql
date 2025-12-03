-- ========================================
-- EXEMPLE: Création de Nouveaux Utilisateurs
-- ========================================
-- Hash BCrypt pour "admin123": $2a$10$b5Kmqax0VI4FnECxBUG4ge6cf0W3lluVdQ5beJDjgSQu34kP4uCPK
-- (Généré via: curl http://localhost:8089/test/generate-hash)

-- ========================================
-- 1. Créer un Agent de Coopération Technique
-- ========================================
INSERT INTO COPT.APP_USER (
    USER_ID, 
    USERNAME, 
    PASSWORD, 
    EMAIL, 
    FIRST_NAME, 
    LAST_NAME, 
    ROLE, 
    BUREAU_CODE, 
    ACTIVE, 
    CREATED_AT
) VALUES (
    USER_SEQ.NEXTVAL,
    'karim.ben.salem',
    '$2a$10$b5Kmqax0VI4FnECxBUG4ge6cf0W3lluVdQ5beJDjgSQu34kP4uCPK',
    'karim.bensalem@cnss.tn',
    'Karim',
    'Ben Salem',
    'AGENT_COOP_TECH',
    'SFAX',
    1,
    CURRENT_TIMESTAMP
);

-- ========================================
-- 2. Créer un Manager
-- ========================================
INSERT INTO COPT.APP_USER VALUES (
    USER_SEQ.NEXTVAL,
    'fatma.trabelsi',
    '$2a$10$b5Kmqax0VI4FnECxBUG4ge6cf0W3lluVdQ5beJDjgSQu34kP4uCPK',
    'fatma.trabelsi@cnss.tn',
    'Fatma',
    'Trabelsi',
    'MANAGER',
    'TUNIS',
    1,
    CURRENT_TIMESTAMP,
    NULL
);

-- ========================================
-- 3. Créer un Agent CNSS
-- ========================================
INSERT INTO COPT.APP_USER VALUES (
    USER_SEQ.NEXTVAL,
    'ahmed.gharbi',
    '$2a$10$b5Kmqax0VI4FnECxBUG4ge6cf0W3lluVdQ5beJDjgSQu34kP4uCPK',
    'ahmed.gharbi@cnss.tn',
    'Ahmed',
    'Gharbi',
    'AGENT_CNSS',
    'SOUSSE',
    1,
    CURRENT_TIMESTAMP,
    NULL
);

COMMIT;

-- ========================================
-- Vérification
-- ========================================
SELECT 
    username,
    email,
    first_name || ' ' || last_name AS nom_complet,
    role,
    bureau_code,
    CASE WHEN active = 1 THEN 'Actif' ELSE 'Inactif' END AS statut,
    TO_CHAR(created_at, 'DD/MM/YYYY HH24:MI') AS date_creation
FROM COPT.APP_USER
ORDER BY created_at DESC;

-- ========================================
-- Statistiques
-- ========================================
SELECT 
    role,
    COUNT(*) AS nombre
FROM COPT.APP_USER
GROUP BY role;
