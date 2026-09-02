-- Demo-only seed data. Remove these rows after testing.
-- The password_hash values are non-login demo placeholders.
INSERT INTO users (name, mobile, email, password_hash)
VALUES
    ('Demo User One', '9000000001', 'demo.one@example.com', 'demo-seed-not-for-login'),
    ('Demo User Two', '9000000002', 'demo.two@example.com', 'demo-seed-not-for-login'),
    ('Demo User Three', '9000000003', 'demo.three@example.com', 'demo-seed-not-for-login')
ON CONFLICT (email) DO NOTHING;
