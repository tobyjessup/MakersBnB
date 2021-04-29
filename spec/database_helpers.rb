require './lib/database_connection'

def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE user_id = '#{id}';")
end
