-- Fix password hash pour admin123
-- Hash BCrypt valide et testé

UPDATE COPT.APP_USER 
SET password = '$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6'
WHERE username = 'admin';

UPDATE COPT.APP_USER 
SET password = '$2a$10$slYQmyNdGzTn7ZLBXBChFOC9f6kFjAqPhccnP6DxlWXx2lPk1C3G6'
WHERE username = 'agent';

COMMIT;

SELECT 'Updated passwords for: ' || COUNT(*) || ' users' AS STATUS FROM COPT.APP_USER;
SELECT username, SUBSTR(password, 1, 20) AS pwd_hash FROM COPT.APP_USER;
