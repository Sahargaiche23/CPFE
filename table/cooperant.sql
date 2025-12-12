-- =====================================================
-- Table COOPERANT - Gestion des Coopérants (Personnes)
-- Schema: COPT
-- =====================================================

-- Création de la séquence
CREATE SEQUENCE COPT.COOPERANT_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Création de la table COOPERANT
CREATE TABLE COPT.COOPERANT (
    -- Identifiants
    COP_ID              NUMBER(19)      PRIMARY KEY,
    COP_MAT             NUMBER(19)      UNIQUE,
    COP_CLE             NUMBER(5),
    
    -- Informations personnelles - Français
    NOM_FR              VARCHAR2(100)   NOT NULL,
    PRENOM_FR           VARCHAR2(100)   NOT NULL,
    ADRESSE_FR          VARCHAR2(500)   NOT NULL,
    CODE_POSTAL         VARCHAR2(10),
    LOCALITE_FR         VARCHAR2(100),
    LIEU_NAISSANCE_FR   VARCHAR2(100),
    
    -- Informations personnelles - Arabe
    NOM_AR              NVARCHAR2(100),
    PRENOM_AR           NVARCHAR2(100),
    ADRESSE_AR          NVARCHAR2(500),
    LOCALITE_AR         NVARCHAR2(100),
    LIEU_NAISSANCE_AR   NVARCHAR2(100),
    
    -- Date de naissance
    DATE_NAISSANCE      DATE,
    
    -- Contact
    TELEPHONE           VARCHAR2(20),
    FAX                 VARCHAR2(20),
    EMAIL               VARCHAR2(100),
    
    -- Pièce d'identité
    TYPE_PIECE_IDENTITE VARCHAR2(50),    -- CIN, Passeport, Carte Séjour
    NUM_PIECE_IDENTITE  VARCHAR2(50)     NOT NULL,
    
    -- Nationalité
    NATIONALITE         VARCHAR2(100),
    
    -- Type de Régime
    -- 500 = Coopérant Général
    -- 510 = Coopérant Agricole Amélioré
    -- 515 = Régime Agricole
    CODE_REGIME         VARCHAR2(10)    NOT NULL,
    
    -- Fichiers joints (chemins relatifs)
    FICHIER_DOSSIER     VARCHAR2(500),   -- PDF, Word, Scan
    FICHIER_IDENTITE    VARCHAR2(500),   -- Copie pièce identité
    FICHIER_AUTRE       VARCHAR2(500),   -- Autres documents
    
    -- Validation par Agent
    STATUT_VALIDATION   VARCHAR2(20)    DEFAULT 'EN_ATTENTE',
    DATE_VALIDATION     TIMESTAMP,
    VALIDE_PAR          NUMBER(19),      -- ID de l'agent
    MOTIF_REJET         VARCHAR2(500),
    
    -- Audit
    ACTIF               NUMBER(1)       DEFAULT 1,
    CREATED_AT          TIMESTAMP       DEFAULT SYSTIMESTAMP,
    UPDATED_AT          TIMESTAMP,
    CREATED_BY          NUMBER(19),
    
    -- Contraintes
    CONSTRAINT CHK_CODE_REGIME CHECK (CODE_REGIME IN ('500', '510', '515')),
    CONSTRAINT CHK_STATUT_VALIDATION CHECK (STATUT_VALIDATION IN ('EN_ATTENTE', 'VALIDE', 'REJETE')),
    CONSTRAINT CHK_TYPE_PIECE CHECK (TYPE_PIECE_IDENTITE IN ('CIN', 'PASSEPORT', 'CARTE_SEJOUR', 'AUTRE'))
);

-- Index pour améliorer les performances
CREATE INDEX COPT.IDX_COOPERANT_MAT ON COPT.COOPERANT(COP_MAT, COP_CLE);
CREATE INDEX COPT.IDX_COOPERANT_NOM_FR ON COPT.COOPERANT(NOM_FR);
CREATE INDEX COPT.IDX_COOPERANT_NOM_AR ON COPT.COOPERANT(NOM_AR);
CREATE INDEX COPT.IDX_COOPERANT_REGIME ON COPT.COOPERANT(CODE_REGIME);
CREATE INDEX COPT.IDX_COOPERANT_STATUT ON COPT.COOPERANT(STATUT_VALIDATION);
CREATE INDEX COPT.IDX_COOPERANT_PIECE ON COPT.COOPERANT(NUM_PIECE_IDENTITE);

-- Commentaires sur la table
COMMENT ON TABLE COPT.COOPERANT IS 'Table des coopérants - Personnes physiques affiliées';
COMMENT ON COLUMN COPT.COOPERANT.COP_ID IS 'Identifiant unique du coopérant';
COMMENT ON COLUMN COPT.COOPERANT.COP_MAT IS 'Matricule du coopérant';
COMMENT ON COLUMN COPT.COOPERANT.COP_CLE IS 'Clé de contrôle du matricule';
COMMENT ON COLUMN COPT.COOPERANT.CODE_REGIME IS 'Type de régime: 500=Général, 510=Agricole Amélioré, 515=Agricole';
COMMENT ON COLUMN COPT.COOPERANT.STATUT_VALIDATION IS 'Statut: EN_ATTENTE, VALIDE, REJETE';

-- Table de référence pour les types de régime
CREATE TABLE COPT.TYPE_REGIME (
    CODE_REGIME     VARCHAR2(10)    PRIMARY KEY,
    LIBELLE_FR      VARCHAR2(100)   NOT NULL,
    LIBELLE_AR      NVARCHAR2(100),
    ACTIF           NUMBER(1)       DEFAULT 1
);

-- Insertion des types de régime
INSERT INTO COPT.TYPE_REGIME (CODE_REGIME, LIBELLE_FR, LIBELLE_AR, ACTIF) VALUES ('500', 'Coopérant Général', N'التعاون العام', 1);
INSERT INTO COPT.TYPE_REGIME (CODE_REGIME, LIBELLE_FR, LIBELLE_AR, ACTIF) VALUES ('510', 'Coopérant Agricole Amélioré', N'التعاون الفلاحي المحسن', 1);
INSERT INTO COPT.TYPE_REGIME (CODE_REGIME, LIBELLE_FR, LIBELLE_AR, ACTIF) VALUES ('515', 'Régime Agricole', N'النظام الفلاحي', 1);

COMMIT;

-- Trigger pour mise à jour automatique de UPDATED_AT
CREATE OR REPLACE TRIGGER COPT.TRG_COOPERANT_UPDATE
BEFORE UPDATE ON COPT.COOPERANT
FOR EACH ROW
BEGIN
    :NEW.UPDATED_AT := SYSTIMESTAMP;
END;
/

-- Vue pour faciliter les requêtes avec libellé régime
CREATE OR REPLACE VIEW COPT.V_COOPERANT AS
SELECT 
    c.*,
    r.LIBELLE_FR AS LIBELLE_REGIME_FR,
    r.LIBELLE_AR AS LIBELLE_REGIME_AR,
    c.PRENOM_FR || ' ' || c.NOM_FR AS NOM_COMPLET_FR,
    c.PRENOM_AR || ' ' || c.NOM_AR AS NOM_COMPLET_AR,
    c.COP_MAT || '-' || c.COP_CLE AS MATRICULE_COMPLET
FROM COPT.COOPERANT c
LEFT JOIN COPT.TYPE_REGIME r ON c.CODE_REGIME = r.CODE_REGIME
WHERE c.ACTIF = 1;

-- Données de test
INSERT INTO COPT.COOPERANT (
    COP_ID, COP_MAT, COP_CLE,
    NOM_FR, PRENOM_FR, ADRESSE_FR, CODE_POSTAL, LOCALITE_FR, LIEU_NAISSANCE_FR,
    NOM_AR, PRENOM_AR, ADRESSE_AR, LOCALITE_AR, LIEU_NAISSANCE_AR,
    DATE_NAISSANCE, TELEPHONE, FAX, EMAIL,
    TYPE_PIECE_IDENTITE, NUM_PIECE_IDENTITE, NATIONALITE,
    CODE_REGIME, STATUT_VALIDATION, ACTIF
) VALUES (
    COPT.COOPERANT_SEQ.NEXTVAL, 1001, 45,
    'BENALI', 'Mohamed', '25 Rue de la Liberté', '1000', 'Tunis', 'Tunis',
    N'بن علي', N'محمد', N'25 شارع الحرية', N'تونس', N'تونس',
    TO_DATE('1985-03-15', 'YYYY-MM-DD'), '71123456', '71123457', 'mohamed.benali@email.com',
    'CIN', '08123456', 'Tunisienne',
    '500', 'EN_ATTENTE', 1
);

INSERT INTO COPT.COOPERANT (
    COP_ID, COP_MAT, COP_CLE,
    NOM_FR, PRENOM_FR, ADRESSE_FR, CODE_POSTAL, LOCALITE_FR, LIEU_NAISSANCE_FR,
    NOM_AR, PRENOM_AR, ADRESSE_AR, LOCALITE_AR, LIEU_NAISSANCE_AR,
    DATE_NAISSANCE, TELEPHONE, EMAIL,
    TYPE_PIECE_IDENTITE, NUM_PIECE_IDENTITE, NATIONALITE,
    CODE_REGIME, STATUT_VALIDATION, ACTIF
) VALUES (
    COPT.COOPERANT_SEQ.NEXTVAL, 1002, 43,
    'TRABELSI', 'Fatma', '10 Avenue Habib Bourguiba', '2000', 'Sfax', 'Sfax',
    N'الطرابلسي', N'فاطمة', N'10 شارع الحبيب بورقيبة', N'صفاقس', N'صفاقس',
    TO_DATE('1990-07-22', 'YYYY-MM-DD'), '74654321', 'fatma.trabelsi@email.com',
    'CIN', '08654321', 'Tunisienne',
    '515', 'VALIDE', 1
);

INSERT INTO COPT.COOPERANT (
    COP_ID, COP_MAT, COP_CLE,
    NOM_FR, PRENOM_FR, ADRESSE_FR, CODE_POSTAL, LOCALITE_FR, LIEU_NAISSANCE_FR,
    DATE_NAISSANCE, TELEPHONE, EMAIL,
    TYPE_PIECE_IDENTITE, NUM_PIECE_IDENTITE, NATIONALITE,
    CODE_REGIME, STATUT_VALIDATION, ACTIF
) VALUES (
    COPT.COOPERANT_SEQ.NEXTVAL, 1003, 41,
    'CHAHED', 'Ahmed', '5 Rue Ibn Khaldoun', '3000', 'Sousse', 'Sousse',
    TO_DATE('1978-11-08', 'YYYY-MM-DD'), '73789012', 'ahmed.chahed@email.com',
    'PASSEPORT', 'P12345678', 'Tunisienne',
    '510', 'EN_ATTENTE', 1
);

COMMIT;
