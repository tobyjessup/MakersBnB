require_relative 'database_connection'
require 'bcrypt'

class User
  def self.create(username:, email:, password:, password_confirmation:)
    
    return 1 if username_exist?(username) == true
    return 2 if email_exist?(email) == true
    return 3 if password != password_confirmation
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{encrypted_password}') 
      RETURNING user_id, username , email;"
      )
    User.new(user_id: result[0]['user_id'], username: result[0]['username'], email: result[0]['email'])
  end

  attr_reader :username, :user_id, :email

  def initialize(user_id:, username:, email:)
    @user_id = user_id
    @username = username
    @email = email
  end

  # def self.find(id:)
  #   return  unless id
  #   result = DatabaseConnection.query("SELECT * FROM users WHERE user_id = '#{id}'")
  #   User.new(user_id: result[0]['user_id'], username: result[0]['username'], email: result[0]['email'])
  # end

  def self.authenticate(username:, password:) 
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    return 1 unless result.any?
    return 2 unless BCrypt::Password.new(result[0]['password']) == password
    User.new(user_id: result[0]['user_id'],username: result[0]['username'],email: result[0]['email']) 
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
