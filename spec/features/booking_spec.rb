feature 'Booking' do 
  scenario 'allows a user to book a place' do 
    User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    Listing.create(name: 'myhome', description: 'bythesea', price: '50' ,user_id: '1')
    visit('/listing')
    click_on(class: 'click_listing')
    expect(page).to have_content('myhome')
    expect(page).to have_content('bythesea')
    expect(page).to have_content('50')
    click_button('Request to book')
  end
end