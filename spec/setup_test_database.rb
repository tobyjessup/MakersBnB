require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE Table users, listing, booking RESTART IDENTITY;")
end
