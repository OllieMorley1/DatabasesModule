require_relative './book'

class BookRepository
    def all
        #returns all books
        #SQL: 'SELECT * FROM books;'
        result = DatabaseConnection.exec_params('SELECT * FROM books;', [])
        books = []

        result.each do |x|
            book = Book.new
            book.id = x['id']
            book.title = x['title']
            book.author_name = x['author_name']
            books << book
        end
        return books
    end
end


#repo = BookRepository.new
#books = repo.all
#books.length => 2
#books.first.id => 1
#books.first.title => 'Emma'
#books.first.author_name => 'Jane Austen' 