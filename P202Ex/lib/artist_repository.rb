require_relative './artist'

class ArtistRepository

    def all
        #Returns all artists
        #SQL: SELECT * FROM artists;
        result = DatabaseConnection.exec_params('SELECT * FROM artists;', [])
        artists = []
        result.each do |record|
            artist = Artist.new
            artist.id = record['id']
            artist.name = record['name']
            artist.genre = record['genre']
            artists << artist
        end

        return artists
    end

    def find(id)
        #Returns one entry
        #SQL: SELECT * FROM albums WHERE id = $1
        sql = 'SELECT * FROM artists WHERE id = $1;'
        sql_params = [id]
        result = DatabaseConnection.exec_params(sql, sql_params)

        record = result[0]

        artist = Artist.new
        artist.id = record['id']
        artist.name = record['name']
        artist.genre = record['genre']
        return artist
    end

    def create(artist)
        #creates a new entry in artists table
        #SQL: INSERT INTO artists (name, genre) VALUES($1, $2);
        sql = 'INSERT INTO artists (name, genre) VALUES($1, $2);'
        sql_params = [artist.name, artist.genre]

        DatabaseConnection.exec_params(sql, sql_params)
        #no return
    end

    def delete(id)
        #deletes an entry from artists table
        #SQL: DELETE FROM artists WHERE id = $1;
        sql = 'DELETE FROM artists WHERE id = $1;'
        sql_params = [id]

        DatabaseConnection.exec_params(sql, sql_params)

        #returns nothing
    end

    def update(artist)
        #updates an entry in artists table
        #SQL: UPDATE artists SET name = $1, genre = $2 WHERE id = $3;
        sql = 'UPDATE artists SET name = $1, genre = $2 WHERE id = $3;'
        sql_params = [artist.name, artist.genre, artist.id]

        DatabaseConnection.exec_params(sql, sql_params)

        #returns nothing
    end
end
