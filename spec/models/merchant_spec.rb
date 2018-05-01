RSpec.describe Merchant do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if missing name' do
        merchant = Merchant.create(merchant_id: 1)

        expect(merchant).to_not be_valid
      end
    end
  end
end
