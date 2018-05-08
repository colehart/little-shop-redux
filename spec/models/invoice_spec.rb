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
    it 'can calculate total price' do
      invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
      Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
      Item.create(name:'dork', description:'totally dorked it', unit_price:667, merchant_id:1, image:'dorkface.jpeg')
      invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 1500)
      invoice_item2 = InvoiceItem.create(item_id: 2, invoice_id: 1, quantity: 2, unit_price: 1000)

      total = (invoice_item.quantity * invoice_item.unit_price) + (invoice_item2.quantity * invoice_item2.unit_price)

      expect(invoice.total_price).to eq(total)
    end
  end

  describe 'class methods' do
    it 'can calculate total invoices by status' do
      Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
      Invoice.create(customer_id: 2, merchant_id: 4, status: 'pending')
      Invoice.create(customer_id: 4, merchant_id: 5, status: 'pending')

      percent1 = Invoice.total_invoices_by_status('pending')
      percent2 = Invoice.total_invoices_by_status('shipped')

      expect(percent1).to eq(66)
      expect(percent2).to eq(33)
    end

    it 'can fetch the dashboard data' do
      invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
      invoice2 = Invoice.create(customer_id: 2, merchant_id: 4, status: 'pending')
      invoice1.invoice_items.create(item_id: 1, quantity: 2, unit_price: 100)
      invoice2.invoice_items.create(item_id: 2, quantity: 4, unit_price: 200)
      invoice2.invoice_items.create(item_id: 3, quantity: 6, unit_price: 600)

      invoices = Invoice.fetch_dashboard_data

      expect(invoices[1].total_cost.to_i).to eq(200)
      expect(invoices[0].total_cost.to_i).to eq(4400)
      expect(invoices[1].total_quantity.to_i).to eq(2)
      expect(invoices[0].total_quantity.to_i).to eq(10)
    end

    it 'can find the invoice by highest unit price' do
      invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
      invoice2 = Invoice.create(customer_id: 2, merchant_id: 4, status: 'pending')
      invoice1.invoice_items.create(item_id: 1, quantity: 2, unit_price: 100)
      invoice2.invoice_items.create(item_id: 2, quantity: 4, unit_price: 200)
      invoice2.invoice_items.create(item_id: 3, quantity: 6, unit_price: 600)

      highest_invoice = Invoice.highest_by_unit_price

      expect(highest_invoice.merchant_id).to eq(4)
    end

    it 'can find the invoice by lowest unit price' do
      invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
      invoice2 = Invoice.create(customer_id: 2, merchant_id: 4, status: 'pending')
      invoice1.invoice_items.create(item_id: 1, quantity: 2, unit_price: 100)
      invoice2.invoice_items.create(item_id: 2, quantity: 4, unit_price: 200)
      invoice2.invoice_items.create(item_id: 3, quantity: 6, unit_price: 600)

      lowest_invoice = Invoice.lowest_by_unit_price

      expect(lowest_invoice.merchant_id).to eq(1)
    end

    it 'can find the invoice by highest quantity' do
      invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
      invoice2 = Invoice.create(customer_id: 2, merchant_id: 4, status: 'pending')
      invoice1.invoice_items.create(item_id: 1, quantity: 2, unit_price: 100)
      invoice2.invoice_items.create(item_id: 2, quantity: 4, unit_price: 200)
      invoice2.invoice_items.create(item_id: 3, quantity: 6, unit_price: 600)

      highest_invoice = Invoice.highest_by_quantity

      expect(highest_invoice.merchant_id).to eq(4)
    end

    it 'can find the invoice by lowest quantity' do
      invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
      invoice2 = Invoice.create(customer_id: 2, merchant_id: 4, status: 'pending')
      invoice1.invoice_items.create(item_id: 1, quantity: 2, unit_price: 100)
      invoice2.invoice_items.create(item_id: 2, quantity: 4, unit_price: 200)
      invoice2.invoice_items.create(item_id: 3, quantity: 6, unit_price: 600)

      lowest_invoice = Invoice.lowest_by_quantity

      expect(lowest_invoice.merchant_id).to eq(1)
    end
  end
end
