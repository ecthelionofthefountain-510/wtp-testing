INSERT INTO users (first_name, password, company, created_at, role_id, email)
VALUES ('KevinAdmin', 'abc123', 'tele', NOW(), 2, 'kevin.admin@gmail.com')
ON CONFLICT (email) DO NOTHING;