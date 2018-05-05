RSpec.describe Invoice do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if missing merchant_id' do
        invoice = Invoice.create(customer_id: 1, status: 'pending')
        expect(invoice).to_not be_valid
      end

      it 'should be invalid if missing status' do
        invoice = Invoice.create(customer_id: 1, merchant_id: 225)
        expect(invoice).to_not be_valid
      end
    end
  end
end
