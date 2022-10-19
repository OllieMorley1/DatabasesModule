require_relative 'lib/database_connection'
require_relative 'lib/post_repository'

DatabaseConnection.connect('blog')

post = PostRepository.new

post2 = post.post_with_comments(2)

comments = []
 
post2.comments.each do |x|
    comments << x.comment
end

puts comments