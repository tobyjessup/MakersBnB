require_relative 'database_connection'

class Booking
  def self.create(date, listing_id, user_id)
    result = DatabaseConnection.query("INSERT INTO booking (date, user_id, listing_id) VALUES('#{date}', '#{user_id}', '#{listing_id}') RETURNING date, user_id, listing_id;")
    # Listing.new(listing_id: result[0]['listing_id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['user_id'])
    date_exists = DatabaseConnection.query("SELECT CASE WHEN EXISTS (SELECT * FROM booking WHERE date = '#{date}') THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END;")
  end
end