RSpec.describe Merchant do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if missing name' do
        merchant = Merchant.create
        expect(merchant).to_not be_valid
      end

      it 'should add a merchant with a name' do
        merchant = Merchant.create(name: 'Cole')
        expect(merchant).to be_valid
      end
    end

    describe 'class methods' do
      it 'fetches dashboard data' do
        merchant1 = Merchant.create(name: 'Cole')
        merchant2 = Merchant.create(name: 'Steven Tyler')
        merchant1.items.create(name: 'bork', description: 'totally borked it', unit_price: 100, image: 'borkface.jpeg')
        merchant2.items.create(name: 'gork', description: 'totally gorked it', unit_price: 200, image: 'gorkface.jpeg')
        merchant2.items.create(name: 'spork', description: 'totally sporked it', unit_price: 400, image: 'sporkface.jpeg')

        merchants = Merchant.fetch_dashboard_data

        expect(merchants[1].total_cost.to_i).to eq(100)
        expect(merchants[0].total_cost.to_i).to eq(600)
        expect(merchants[1].avg_price.to_i).to eq(100)
        expect(merchants[0].avg_price.to_i).to eq(300)
        expect(merchants[1].item_count.to_i).to eq(1)
        expect(merchants[0].item_count.to_i).to eq(2)
      end

      it 'fetches merchant with most items' do
        name = 'Steven Tyler'
        merchant1 = Merchant.create(name: 'Cole')
        merchant2 = Merchant.create(name: name)
        merchant1.items.create(name: 'bork', description: 'totally borked it', unit_price: 100, image: 'borkface.jpeg')
        merchant2.items.create(name: 'gork', description: 'totally gorked it', unit_price: 200, image: 'gorkface.jpeg')
        merchant2.items.create(name: 'spork', description: 'totally sporked it', unit_price: 400, image: 'sporkface.jpeg')

        merchant = Merchant.with_most_items

        expect(merchant.name).to eq(name)
      end

      it 'fetches merchant with highest cost' do
        name = 'Steven Tyler'
        merchant1 = Merchant.create(name: 'Cole')
        merchant2 = Merchant.create(name: name)
        merchant1.items.create(name: 'bork', description: 'totally borked it', unit_price: 100, image: 'borkface.jpeg')
        merchant2.items.create(name: 'gork', description: 'totally gorked it', unit_price: 200, image: 'gorkface.jpeg')
        merchant2.items.create(name: 'spork', description: 'totally sporked it', unit_price: 400, image: 'sporkface.jpeg')

        merchant = Merchant.with_highest_cost

        expect(merchant.name).to eq(name)
      end
    end
  end
end
