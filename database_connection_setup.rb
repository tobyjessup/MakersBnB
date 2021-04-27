require './lib/database_connection'

if ENV['ENVIRNMENT'] == 'test'
  DatabaseConnection.setup('makersbnb_test')
else
  DatabaseConnection.setup('makersbnb')
end
