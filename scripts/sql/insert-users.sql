-- Insérer utilisateurs de test
-- Le password est déjà hashé avec BCrypt pour "admin123"

DELETE FROM COPT.APP_USER;

INSERT INTO COPT.APP_USER (USER_ID, USERNAME, PASSWORD, EMAIL, FIRST_NAME, LAST_NAME, ROLE, BUREAU_CODE, ACTIVE, CREATED_AT)
VALUES (1, 'admin', '$2a$10$8ZqPPcT0rJw8JCVHcBCh1O4aJCxJxV5jGzqGZqHqv5sBqvY0Q1xiq', 
        'admin@cnss.tn', 'Admin', 'CNSS', 'ADMIN', 'TUNIS', 1, CURRENT_TIMESTAMP);

INSERT INTO COPT.APP_USER (USER_ID, USERNAME, PASSWORD, EMAIL, FIRST_NAME, LAST_NAME, ROLE, BUREAU_CODE, ACTIVE, CREATED_AT)
VALUES (2, 'agent', '$2a$10$8ZqPPcT0rJw8JCVHcBCh1O4aJCxJxV5jGzqGZqHqv5sBqvY0Q1xiq', 
        'agent@cnss.tn', 'Agent', 'Coop Tech', 'AGENT_COOP_TECH', 'TUNIS', 1, CURRENT_TIMESTAMP);

COMMIT;

SELECT 'Utilisateurs insérés avec succès!' AS STATUS FROM DUAL;
SELECT username, email, role FROM COPT.APP_USER;
