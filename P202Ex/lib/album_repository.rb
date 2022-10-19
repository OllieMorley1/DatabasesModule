require_relative './album'

class AlbumRepository

    def all
        #Returns all albums
        #SQL: SELECT * FROM albums;
        result = DatabaseConnection.exec_params('SELECT * FROM albums;', [])
        albums = []
        result.each do |record|
            album = Album.new
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            album.artist_id = record['artist_id']
            albums << album
        end
        return albums
    end

    def find(id)
        #Returns one entry
        #SQL: SELECT * FROM albums WHERE id = $1
        sql = 'SELECT * FROM albums WHERE id = $1;'
        sql_params = [id]
        result = DatabaseConnection.exec_params(sql, sql_params)

        record = result[0]

        album = Album.new
        album.id = record['id']
        album.title = record['title']
        album.release_year = record['release_year']
        album.artist_id = record['artist_id']
        return album
    end

    def create(album)
        sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES($1, $2, $3)'
        sql_params = [album.title, album.release_year, album.artist_id]

        DatabaseConnection.exec_params(sql, sql_params)
    end

    def delete(id)
        sql = 'DELETE FROM albums WHERE id = $1'
        sql_params = [id]

        DatabaseConnection.exec_params(sql, sql_params)
    end

    def update(album)
        sql = 'UPDATE albums SET title = $1, release_year = $2, artist_id = $3 WHERE id = $4'
        sql_params = [album.title, album.release_year, album.artist_id, album.id]

        DatabaseConnection.exec_params(sql, sql_params)
    end
end

#repo = ArtistRepository.new
#artists = repo.all
#artists.length => 2
#artists.first.name => 'Pixies'