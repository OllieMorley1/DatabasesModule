As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.

## 1.List all the nouns
posts, title, content, comments, user_name

## 2.Decide whether a noun is a record (a table name) or a property of it (a column).
Table: posts
Columns: title, contents

Table: comments
Columns: user_name, comment, post_id

## 3.Decide the column types.
Table: posts
Columns: title (text), contents (text)

Table: comments
Columns: user_name (text), comment (text), post_id (int)

## 4.Decide how the two tables will be related (where the foreign key is needed).
post_id fk

## 5.Write the SQL to create the tables.
CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title text,
    contents text
);

CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
    user_name text,
    comment text,
    post_id int,
    constraint fk_post foreign key (post_id) references posts(id)
);