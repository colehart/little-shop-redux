RSpec.describe Item do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if missing title' do
        item = Item.create(description: 'Stuff', price: 100)
        expect(item).to_not be_valid
      end
      it 'should be invalid if missing description' do
        item = Item.create(title: 'Stuff', price: 100)
        expect(item).to_not be_valid
      end
      it 'should be invalid if missing title' do
        item = Item.create(description: 'Stuff', price: 100)
        expect(item).to_not be_valid
      end

      it 'should add a item with a valid properties' do
        item = Item.create(title: 'Cole', description: 'Stuff', price: 100)
        expect(item).to be_valid
      end
    end
  end
end
