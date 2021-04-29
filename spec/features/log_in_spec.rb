feature 'login' do
  scenario ' a user can log in' do
    User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')

    visit '/user/login'
    fill_in(:username, with: 'test')
    fill_in(:password, with: 'password123')
    click_button('Log in')
    expect(page).to have_content 'Makers'
  end
end