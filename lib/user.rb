require_relative 'database_connection'
require 'bcrypt'

class User
  def self.create(username:, email:, password:, password_confirmation:)
    
    return 1 if username_exist?(username) == true
    return 2 if email_exist?(email) == true
    return 3 if password != password_confirmation
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{encrypted_password}') 
      RETURNING id, username , email;"
      )
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  attr_reader :username, :id, :email

  def initialize(username:, id:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.authenticate(username:, password:) 
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    return 1 unless result.any?
    return 2 unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'],username: result[0]['username'],email: result[0]['email']) 
  end



  def self.email_exist?(email)
    db_search = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    db_search.any?
  end

  def self.username_exist?(username)
    db_search = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    db_search.any?
  end
end
