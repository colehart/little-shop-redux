RSpec.describe InvoiceItem do
  describe 'validations' do
    describe 'required fields' do
      it 'should be valid if all fields present' do
        invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 2, unit_price: 5590)
        expect(invoice_item).to be_valid
      end

      it 'should not be valid if item_id missing' do
        invoice_item = InvoiceItem.create(invoice_id: 1, quantity: 2, unit_price: 5590)
        expect(invoice_item).to_not be_valid
      end

      it 'should not be valid if invoice_id missing' do
        invoice_item = InvoiceItem.create(item_id: 1, quantity: 2, unit_price: 5590)
        expect(invoice_item).to_not be_valid
      end

      it 'should not be valid if quantity missing' do
        invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, unit_price: 5590)
        expect(invoice_item).to_not be_valid
      end

      it 'should not be valid if unit_price missing' do
        invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 2)
        expect(invoice_item).to_not be_valid
      end
    end
  end
end
