RSpec.describe Item do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if missing name' do
        item = Item.create(description: 'Stuff', unit_price: 100, image: './placeholder.jpg')
        expect(item).to_not be_valid
      end

      it 'should be invalid if missing description' do
        item = Item.create(name: 'Stuff', unit_price: 100, image: './placeholder.jpg')
        expect(item).to_not be_valid
      end

      it 'should be invalid if missing name' do
        item = Item.create(description: 'Stuff', unit_price: 100, image: './placeholder.jpg')
        expect(item).to_not be_valid
      end

      it 'should be invalid if missing unit price' do
        item = Item.create(name: 'Cole', description: 'Stuff', image: './placeholder.jpg')
        expect(item).to_not be_valid
      end

      it 'should be invalid if missing image' do
        item = Item.create(name: 'Cole', description: 'Stuff')
        expect(item).to_not be_valid
      end

      it 'should add a item with a valid properties' do
        item = Item.create(name: 'Cole', description: 'Stuff', unit_price: 100, image: './placeholder.jpg')
        expect(item).to be_valid
      end
    end
  end
  describe 'class methods' do
    it 'can find average unit price' do
      item1 = Item.create(name: 'Cole', description: 'Stuff', unit_price: 100, image: './placeholder.jpg')
      item2 = Item.create(name: 'Steven Tyler', description: 'fluff', unit_price: 200, image: './placeholder.jpg')

      item_average = Item.average_unit_price

      expect(item_average).to eq(150)
    end

    it 'can find newest item' do
      item1 = Item.create(name: 'Cole', description: 'Stuff', unit_price: 100, image: './placeholder.jpg')
      item2 = Item.create(name: 'Steven Tyler', description: 'fluff', unit_price: 200, image: './placeholder.jpg')

      newest_item = Item.newest

      expect(newest_item.description).to eq('fluff')
    end

    it 'can find oldest item' do
      item1 = Item.create(name: 'Cole', description: 'Stuff', unit_price: 100, image: './placeholder.jpg')
      item2 = Item.create(name: 'Steven Tyler', description: 'fluff', unit_price: 200, image: './placeholder.jpg')

      oldest_item = Item.oldest

      expect(oldest_item.description).to eq('Stuff')
    end
  end
end
