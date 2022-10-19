require 'post_repository'

def reset_posts_table
    seed_sql = File.read('spec/posts_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end

  RSpec.describe AccountRepository do

    before(:each) do 
        reset_posts_table
      end
    
    describe '#all' do 
        it 'returns all posts in db' do
            repo = PostRepository.new
            posts = repo.all 
            expect(posts.length).to eq 2
            expect(posts.last.title).to eq 'Title2'
        end
    end

    describe '#find' do
        it 'returns an individual record from db' do 
            repo = PostRepository.new
            post = repo.find(1)
            expect(post.title).to eq 'Title1'
            expect(post.content).to eq 'Content1'
        end
    end

    describe '#create' do
        it 'creates a record in the db' do
            repo = PostRepository.new
            post = Post.new
            post.title = 'TITLE'
            post.content = 'CONTENT'
            post.views = 521738297
            post.account_id = 1
            repo.create(post)
            expect(repo.find(3).content).to eq 'CONTENT'
        end
    end

    describe '#delete' do
        it 'deletes a record from the db' do
            repo = PostRepository.new
            original_length = repo.all.length
            repo.delete(1)
            expect(repo.all.length).to eq (original_length - 1)
        end
    end

    describe '#update' do 
        it 'updates a record in the db' do
            repo = PostRepository.new
            post = repo.find(1)
            post.title = 'NEWTITLE'
            repo.update(post)
            updated_post = repo.find(1)
            expect(updated_post.title).to eq 'NEWTITLE'
            expect(updated_post.views).to eq 10
        end
    end
end
