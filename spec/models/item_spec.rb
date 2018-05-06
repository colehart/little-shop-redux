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
end
