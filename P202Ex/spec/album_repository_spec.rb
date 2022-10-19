require 'album_repository'

RSpec.describe AlbumRepository do

    def reset_albums
        seed_sql = File.read('spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_albums
    end

    it 'pulls all album data from db' do
        repo = AlbumRepository.new
        albums = repo.all
        expect(albums.length).to eq 2
        expect(albums.first.title).to eq 'Doolittle'
        expect(albums.first.release_year).to eq '1989'
        expect(albums.first.artist_id).to eq '1'
    end

    it 'finds 1 specific entry in db' do
        repo = AlbumRepository.new
        album = repo.find(1)
        expect(album.title).to eq 'Doolittle'
        expect(album.release_year).to eq '1989'
    end

    it 'creates a new album entry in albums table' do
        repo = AlbumRepository.new
        album = Album.new
        album.title = 'Trompe le Monde'
        album.release_year = 1991
        album.artist_id = 1
        repo.create(album)
        all_albums = repo.all
        expect(all_albums.length).to eq 3
    end

    it 'deletes an album from the albums table' do
        repo = AlbumRepository.new
        repo.delete(1)
        expect(repo.all.length).to eq 1
    end

    it 'updates an album in the albums table' do 
        repo = AlbumRepository.new
        album = repo.find(1)
        album.title = 'New'
        album.release_year = 1952
        album.artist_id = 2
        repo.update(album)
        updated_album = repo.find(1)
        expect(updated_album.title).to eq 'New'
        expect(updated_album.release_year).to eq '1952'
    end
end