-- Update avec hash BCrypt VALIDE généré par le service
-- Hash: $2a$10$b5Kmqax0VI4FnECxBUG4ge6cf0W3lluVdQ5beJDjgSQu34kP4uCPK
-- Password: admin123
-- Tested and verified: matches = true

UPDATE COPT.APP_USER 
SET password = '$2a$10$b5Kmqax0VI4FnECxBUG4ge6cf0W3lluVdQ5beJDjgSQu34kP4uCPK'
WHERE username = 'admin';

UPDATE COPT.APP_USER 
SET password = '$2a$10$b5Kmqax0VI4FnECxBUG4ge6cf0W3lluVdQ5beJDjgSQu34kP4uCPK'
WHERE username = 'agent';

COMMIT;

SELECT 'Password updated for: ' || COUNT(*) || ' users' AS STATUS FROM COPT.APP_USER;
SELECT username, email, role, SUBSTR(password, 1, 30) AS pwd_hash FROM COPT.APP_USER;
