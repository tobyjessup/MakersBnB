feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('username', with: 'test')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('password_confirmation', with: 'password123')
    click_button('Sign up')
    
    expect(page).to have_content "Feel at home, anywhere"
    
  end
  scenario 'password has to match' do
    visit '/'
    fill_in('username', with: 'test')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('password_confirmation', with: 'password')
    click_button('Sign up')

    expect(page).not_to have_content "Log in to MakersBnB"
    
  end
end
