require 'book_repo'

def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
end

RSpec.describe BookRepository do
      
    before(:each) do 
        reset_books_table
    end

    it 'integrates ruby + sql' do
        repo = BookRepository.new
        books = repo.all
        expect(books.length).to eq 2
        expect(books.first.id).to eq '1'
        expect(books.first.title).to eq 'Emma'
        expect(books.first.author_name).to eq 'Jane Austen' 
    end
end
