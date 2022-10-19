TRUNCATE TABLE tags RESTART IDENTITY cascade; 

INSERT INTO tags (tag_name) VALUES ('tag1');
INSERT INTO tags (tag_name) VALUES ('tag2');
INSERT INTO tags (tag_name) VALUES ('tag3');