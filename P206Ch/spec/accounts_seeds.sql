TRUNCATE TABLE accounts RESTART IDENTITY cascade; 

INSERT INTO accounts (email_address, username) VALUES ('ollie@gmail.com', 'olliem');
INSERT INTO accounts (email_address, username) VALUES ('lorenzo@gmail.com', 'lorenzog');