require_relative 'database_connection'

class Booking
attr_reader :booking_id, :date, :listing_id, :user_id
  def initialize(date:, listing_id:, user_id:)
    @date = date
    @listing_id = listing_id
    @user_id = user_id
  end
  def self.create(date:, listing_id:, user_id:)
    return 1 if date_exist?(date) ==true
    result = DatabaseConnection.query("INSERT INTO booking (date, user_id, listing_id) VALUES('#{date}', '#{user_id}', '#{listing_id}') RETURNING date, user_id, listing_id;")
    Booking.new(date: result[0]['date'], listing_id: result[0]['listing_id'], user_id: result[0]['user_id'] )
  end

  def self.date_exist?(date)
    db_search = DatabaseConnection.query("SELECT * FROM booking WHERE date = '#{date}';")
    db_search.any?
  end


end

