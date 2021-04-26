feature 'Listing' do
  scenario 'a user is able to post something' do
    visit('/listing')
    expect(page).to have_content('Create a new listing')
    fill_in(:name, with: 'myhome')
    fill_in(:description, with: 'bythesea')
    fill_in(:price, with: '1000')
    click_button('Submit')

    expect(page).to have_content('myhome')
    expect(page).to have_content('bythesea')
    expect(page).to have_content('1000')
  end 
end
