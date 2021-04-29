require './lib/database_connection'

def persisted_data_user(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE user_id = '#{id}';")
end

def persisted_data_listing(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE listing_id = '#{id}';")
end
