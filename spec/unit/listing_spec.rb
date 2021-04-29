require 'listing'

describe Listing do
  context('#create') do 
    it('Allows the user to create a listing') do 
      user = User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      listing = Listing.create(name: 'name', description: 'description', price: 100, user_id: '1')
      persisted_data = persisted_data_listing(table: 'listing', id: listing.listing_id)
      expect(listing).to be_a Listing
      expect(listing.listing_id).to eq(persisted_data.first['listing_id'])
    end

    context('#all') do 
      it 'Allows the user to see all the listings' do 
        user = User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
        listing = Listing.create(name: 'name', description: 'description', price: 100, user_id: '1')
        Listing.create(name: 'second', description: 'text', price: 200, user_id:'1')
        persisted_data = persisted_data_listing(table: 'listing', id: listing.listing_id)

        list = Listing.all
        expect(list.first).to be_a Listing
        expect(list.length).to eq(2)
        expect(list.first.name).to eq('name')
        expect(list.first.description).to eq('description')
        expect(list.first.price).to eq('100.00')
      end
    end

    context('#find') do 
      it 'Returns a selected item ' do 
        user = User.create(username: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
        listing = Listing.create(name: 'name', description: 'description', price: 100, user_id: '1')
        listing_search = Listing.find(id: listing.listing_id)
        expect(listing_search).to be_a Listing
        expect(listing_search.name).to eq('name')
        expect(listing_search.description).to eq('description')
        expect(listing_search.price).to eq('100.00')
      end
    end
  end
end

