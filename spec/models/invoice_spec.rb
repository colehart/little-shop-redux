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
  describe 'instance methods' do
    it 'can calculate total cost' do
      invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
      Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
      Item.create(name:'dork', description:'totally dorked it', unit_price:667, merchant_id:1, image:'dorkface.jpeg')
      invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 1500)
      invoice_item2 = InvoiceItem.create(item_id: 2, invoice_id: 1, quantity: 2, unit_price: 1000)

      total = (invoice_item.quantity * invoice_item.unit_price) + (invoice_item2.quantity * invoice_item2.unit_price)

      expect(invoice.total_price).to eq(total)
    end
  end
end
