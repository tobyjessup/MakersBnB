require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users, listing, booking, availabilty")
  connection.exec("TRUNCATE Table users, listing RESTART IDENTITY;")
end
