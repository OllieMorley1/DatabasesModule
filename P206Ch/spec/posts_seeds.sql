TRUNCATE TABLE posts RESTART IDENTITY; 

INSERT INTO posts (title, content, views, account_id) VALUES ('Title1', 'Content1', 10, 1);
INSERT INTO posts (title, content, views, account_id) VALUES ('Title2', 'Content2', 1000, 2);