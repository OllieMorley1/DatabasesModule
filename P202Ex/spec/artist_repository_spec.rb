require 'artist_repository'

RSpec.describe ArtistRepository do

    def reset_artists
        seed_sql = File.read('spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_artists
    end

    it 'returns all artists' do
        repo = ArtistRepository.new
        artists = repo.all
        expect(artists.length).to eq 2
        expect(artists.first.name).to eq 'Pixies'
    end

    it 'returns an individual artist' do
        repo = ArtistRepository.new
        artist = repo.find(1)
        expect(artist.name).to eq 'Pixies'
    end

    it 'creates a new artist in db' do
        repo = ArtistRepository.new
        artist = Artist.new
        artist.name = 'Roc Marciano'
        artist.genre = 'Hip-Hop'
        repo.create(artist)
        new_artist = repo.find(3)
        expect(new_artist.name).to eq 'Roc Marciano'
    end

    it 'deletes an artist from db' do
        repo = ArtistRepository.new
        repo.delete(1)
        artists = repo.all
        expect(artists.length).to eq 1
        expect(artists.first.id).to eq '2'
    end

    it 'updates an artist in db' do
        repo = ArtistRepository.new
        artist = repo.find(1)
        artist.name = 'yep'
        artist.genre = 'yuhuh'
        repo.update(artist)
        updated_artist = repo.find(1)
        expect(updated_artist.name).to eq 'yep'
    end
end