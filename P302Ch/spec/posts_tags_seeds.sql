TRUNCATE TABLE posts_tags RESTART IDENTITY cascade; 

INSERT INTO posts_tags (post_id, tag_id) VALUES(1, 1);
INSERT INTO posts_tags (post_id, tag_id) VALUES(2, 1);