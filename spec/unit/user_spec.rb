require 'database_helpers'


describe '.create' do
  it 'creates a new user' do
    user = User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end
end

describe '.create' do
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
  end
  it 'when the two passwords that the user has entered are the same a user is created' do
    new_user = User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
  
    expect(new_user).to be_a(User)
  end
  
  it 'when the two passwords that the user enters are different it returns a 3' do
    new_user = User.create(username: 'test', email: 'test@example.com', password: 'password12', password_confirmation: 'password123')
  
    expect(new_user).to eq(3)
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    result = User.find(id: user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end
end

describe '.find' do
  it 'returns nil if there is no ID given' do
    expect(User.find(id: nil)).to eq nil
  end
end

describe 'autentication' do
  it 'allows existing user to sign in' do
    new_user = User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    signed_in_user = User.authenticate(username: 'test', password: 'password123')

    expect(signed_in_user.id).to eq new_user.id
  end
end





