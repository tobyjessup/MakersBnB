require_relative 'database_connection'

class Listing

  attr_reader :name, :description, :price, :listing_id, :user_id

  def initialize(listing_id:, name:, description:, price:, user_id:)
    @listing_id = listing_id
    @name = name
    @description = description
    @price = price
    @user_id =user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM listing")
    result.map do |list|
      Listing.new(
        listing_id: list['listing_id'],
        name: list['name'], 
        description: list['description'], 
        price: list['price'],
        user_id: list['user_id']
        )
    end
  end

<<<<<<< HEAD
  def self.book(date:, userid:, listingid:)


  end

  def self.create(name:, description:, price:)
    result = DatabaseConnection.query("INSERT INTO listing (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING id, name, description, price;")
    Listing.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
=======
  def self.create(name:, description:, price:, user_id:)
    result = DatabaseConnection.query("INSERT INTO listing (name, description, price, user_id) VALUES('#{name}', '#{description}', '#{price}', '#{user_id}') RETURNING listing_id, name, description, price, user_id;")
    Listing.new(listing_id: result[0]['listing_id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['user_id'])
>>>>>>> fe72bc53efb1dfcaded52d5b4d6a24ee297ee26a
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM listing WHERE listing_id = '#{id}';")
    Listing.new(listing_id: result[0]['listing_id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], user_id: result[0]['user_id'])
  end
end
