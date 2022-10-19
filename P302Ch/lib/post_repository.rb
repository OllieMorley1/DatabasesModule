require_relative 'post'
require_relative 'comment'

class PostRepository

    def post_with_comments(id)
        sql = 'SELECT posts.title, comments.comment
        FROM posts 
        JOIN comments ON posts.id = comments.post_id
        WHERE posts.id = $1;'
        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)

        post = Post.new
        post.id = result_set.first['id']
        post.title = result_set.first['title']
        post.contents = result_set.first['contents']


        result_set.each do |record|
            comment = Comment.new
            comment.id = record['id']
            comment.comment = record['comment']
            comment.user_name = record['user_name']
            comment.post_id = record['post_id']
            post.comments << comment
        end
        return post
    end
        
    def find_by_tag(tag)
            sql = 'SELECT posts.title
            FROM posts
            JOIN posts_tags ON posts_tags.post_id = posts.id
            JOIN tags ON posts_tags.tag_id = tags.id
            WHERE tags.tag_name = $1;'
            sql_params = [tag]

            result_set = DatabaseConnection.exec_params(sql, sql_params)
            post_tags = []
            result_set.each do |x|
                post_tags << x.values
            end
            return post_tags
    end

    def find_by_post(id)
        sql = 'SELECT tags.tag_name
        FROM tags
        JOIN posts_tags ON posts_tags.tag_id = tags.id
        JOIN posts ON posts_tags.post_id = posts.id
        WHERE posts.id = $1;'
        sql_params = [id]
        result_set = DatabaseConnection.exec_params(sql, sql_params)


        post_tags = []
        result_set.each do |x|
            post_tags << x.values
        end
        return post_tags
    end
end