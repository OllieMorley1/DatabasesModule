require 'post_repository'

def reset_posts_table
    seed_sql = File.read('spec/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
    connection.exec(seed_sql)
end

def reset_comments_table
    seed_sql = File.read('spec/seeds_comments.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
    connection.exec(seed_sql)
end

def reset_tags_table
  seed_sql = File.read('spec/seeds_tags.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
  connection.exec(seed_sql)
end

def reset_posts_tags_table
  seed_sql = File.read('spec/posts_tags_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
  connection.exec(seed_sql)
end

RSpec.describe PostRepository do
    before(:each) do 
        reset_posts_table
        reset_comments_table
        reset_tags_table
        reset_posts_tags_table
      end

    it 'finds comments from given post' do
        repo = PostRepository.new
        post = repo.post_with_comments(2)
        expect(post.title).to eq('post2')
        expect(post.comments.length).to eq(2)
      end

    it 'finds all posts containing given tag' do
      repo = PostRepository.new
      posts = repo.find_by_tag('tag1')
      expect(posts.length).to eq 2
    end

    it 'finds all tags for given post' do
      repo = PostRepository.new
      tags = repo.find_by_post(1)
      expect(tags.length).to eq 1
      p tags
      expect(tags.include?(['tag1'])).to eq true
    end
  end