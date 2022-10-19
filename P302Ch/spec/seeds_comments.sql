TRUNCATE TABLE comments RESTART IDENTITY; 

INSERT INTO comments (user_name, comment, post_id) VALUES ('user1', 'comment1', 1);
INSERT INTO comments (user_name, comment, post_id) VALUES ('user2', 'comment2', 2);
INSERT INTO comments (user_name, comment, post_id) VALUES ('user3', 'comment3', 2);