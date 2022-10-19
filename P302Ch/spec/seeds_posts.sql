TRUNCATE TABLE posts RESTART IDENTITY cascade; 

INSERT INTO posts (title, contents) VALUES ('post1', 'contents1');
INSERT INTO posts (title, contents) VALUES ('post2', 'contents2');