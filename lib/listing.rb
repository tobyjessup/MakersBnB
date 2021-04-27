require_relative 'database_connection'

class Listing

  attr_reader :name, :description, :price, :id

  def initialize(id:, name:, description:, price:)
    @id = id
    @name = name
    @description = description
    @price = price
  end

  def self.create(name:, description:, price:)
    result = DatabaseConnection.query("INSERT INTO listing (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING id, name, description, price;")
    Listing.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  end
end
