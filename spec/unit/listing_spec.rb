require 'listing'

describe Listing do
  context('#create') do 
    it('Allows the user to create a listing') do 
      # PG.connect(dbname: 'makersbnb_test')
      listing = Listing.create(name: 'name', description: 'description', price: 100)
      persisted_data = persisted_data(table: 'listing', id: listing.id)
      expect(listing).to be_a Listing
      expect(listing.id).to eq(persisted_data.first['id'])
    end
    # context('#all') do 
    #   it 'Allows the user to see all the listings' do 
    #     expect(listing).to be_a Listing
    #     expect(listing.length).to eq(1)
    #     expect(listing.name).to eq('name')
    #     expect(listing.description).to eq('description')
    #     expect(listing.price).to eq(100)
    #   end
  end
end
