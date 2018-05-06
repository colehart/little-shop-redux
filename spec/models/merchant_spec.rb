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
  end
end
