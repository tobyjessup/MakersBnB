feature 'Booking' do 
  scenario 'allows a user to book a place' do 
    Listing.create(name: 'myhome', description: 'bythesea', price: 1000)
    visit('/listing')
    click_on(class: 'click_listing')
    expect(page).to have_content('myhome')
    expect(page).to have_content('bythesea')
    expect(page).to have_content('1000')
    click_button('Request to book')
  end
end