feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('username', with: 'test')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('password confirmation', with: 'password123')
    click_button('Sign up')
    
    expect(page).to have_content "Log in to MakersBnB"
  end
end