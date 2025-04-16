-- Rensa eventuell testdata
DELETE FROM users WHERE email = 'testuser@example.com';

-- Skapa admin-roll om den inte finns
INSERT INTO roles (id, name)
VALUES (2, 'admin')
ON CONFLICT (id) DO NOTHING;

-- Skapa staff-roll om den inte finns
INSERT INTO roles (id, name)
VALUES (1, 'staff')
ON CONFLICT (id) DO NOTHING;

-- Skapa KevinAdmin om den inte finns
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'kevin.admin@gmail.com'
  ) THEN
    INSERT INTO users (first_name, password, created_at, company, role_id, email)
    VALUES (
      'KevinAdmin',
      'abc123',
      NOW(),
      'tele',
      2,
      'kevin.admin@gmail.com'
    );
  END IF;
END $$;