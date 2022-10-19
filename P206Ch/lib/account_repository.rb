require 'account'

class AccountRepository
    def all
        sql = 'SELECT * FROM accounts;'
        sql_params = []
        result = DatabaseConnection.exec_params(sql, sql_params)
        all_accounts = []
        result.each do |record|
            account = Account.new
            account.id = record['id']
            account.email_address = record['email_address']
            account.username = record['username']
            all_accounts << account
        end
        return all_accounts
    end

    def find(id)
        sql = 'SELECT * FROM accounts WHERE id = $1'
        sql_params = [id]
        result_set = DatabaseConnection.exec_params(sql, sql_params)
        result = result_set[0]

        account = Account.new
        account.id = result['id']
        account.email_address = result['email_address']
        account.username = result['username']
        return account
    end

    def create(account)
        sql = 'INSERT INTO accounts (email_address, username) VALUES ($1, $2);'
        sql_params = [account.email_address, account.username]
        DatabaseConnection.exec_params(sql, sql_params)
    end

    def delete(id)
        sql = 'DELETE FROM accounts WHERE id = $1;'
        sql_params = [id]
        DatabaseConnection.exec_params(sql, sql_params)
    end

    def update(account)
        sql = 'UPDATE accounts SET email_address = $1, username = $2 WHERE id = $3'
        sql_params = [account.email_address, account.username, account.id]
        DatabaseConnection.exec_params(sql, sql_params)
    end
end