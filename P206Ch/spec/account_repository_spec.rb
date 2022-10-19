require 'account_repository'

def reset_accounts_table
    seed_sql = File.read('spec/accounts_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
end

RSpec.describe AccountRepository do

    before(:each) do 
        reset_accounts_table
      end
    
    describe '#all' do 
        it 'returns all accounts in db' do
            repo = AccountRepository.new
            accounts = repo.all 
            expect(accounts.length).to eq 2
            expect(accounts.first.username).to eq 'olliem'
        end
    end

    describe '#find' do
        it 'returns an individual record from db' do 
            repo = AccountRepository.new
            user = repo.find(1)
            expect(user.username).to eq 'olliem'
            expect(user.email_address).to eq 'ollie@gmail.com'
        end
    end

    describe '#create' do
        it 'creates a record in the db' do
            repo = AccountRepository.new
            account = Account.new
            account.username = 'username'
            account.email_address = 'email@gmail.com'
            repo.create(account)
            expect(repo.find(3).username).to eq 'username'
        end
    end

    describe '#delete' do
        it 'deletes a record from the db' do
            repo = AccountRepository.new
            original_length = repo.all.length
            repo.delete(1)
            expect(repo.all.length).to eq (original_length - 1)
        end
    end

    describe '#update' do 
        it 'updates a record in the db' do
            repo = AccountRepository.new
            account = repo.find(1)
            account.username = 'newuser'
            repo.update(account)
            updated_account = repo.find(1)
            expect(updated_account.username).to eq 'newuser'
        end
    end
end
