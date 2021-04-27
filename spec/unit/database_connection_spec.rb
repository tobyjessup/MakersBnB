require 'database_connection'

describe DatabaseConnection do
  context '#setup' do
    it 'sets up a connection to the database using PG' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
      DatabaseConnection.setup('makersbnb_test')
    end

    it 'this connection is persistant' do
      connection = DatabaseConnection.setup('makersbnb_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  context '#query' do
    it 'can executes a query via PG' do
      connection = DatabaseConnection.setup('makersbnb_test')
      expect(connection).to receive(:exec).with("SELECT * FROM listing;")
      DatabaseConnection.query("SELECT * FROM listing;")
    end
  end
end
