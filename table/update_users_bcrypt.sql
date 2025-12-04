-- Mettre à jour les utilisateurs avec des mots de passe BCrypt
-- BCrypt hash pour "admin123" est: $2a$10$XptfkjlmcKVeYlXGt.y4Ue8FJKr6VHy4pYhxJ7Pxcq7nV2gXQGH3C

UPDATE COPT.APP_USER
SET PASSWORD = '$2a$10$XptfkjlmcKVeYlXGt.y4Ue8FJKr6VHy4pYhxJ7Pxcq7nV2gXQGH3C'
WHERE USERNAME = 'admin';

COMMIT;
