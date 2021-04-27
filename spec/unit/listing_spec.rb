require 'listing'

describe Listing do
  context('#create') do 
    it('Allows the user to create a listing') do 

      listing = Listing.create(name: 'name', description: 'description', price: 100)
      persisted_data = persisted_data(table: 'listing', id: listing.id)
      expect(listing).to be_a Listing
      expect(listing.id).to eq(persisted_data.first['id'])
    end

    context('#all') do 
      it 'Allows the user to see all the listings' do 
        listing = Listing.create(name: 'name', description: 'description', price: 100)
        Listing.create(name: 'second', description: 'text', price: 200)
        persisted_data = persisted_data(table: 'listing', id: listing.id)

        list = Listing.all
        expect(list.first).to be_a Listing
        expect(list.length).to eq(2)
        expect(list.first.name).to eq('name')
        expect(list.first.description).to eq('description')
        expect(list.first.price).to eq('100')
      end
    end
  end
end

