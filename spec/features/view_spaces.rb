feature 'main page' do
  scenario 'allows to list available space' do
    visit '/listing'
    expect(page).to have_content 'Book a space'
    click_button 'New listing'
    expect(page).to have_content('Create a new listing')
  end
end
