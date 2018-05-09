RSpec.describe 'A user can edit an invoice' do
  it 'shows invoice id headline with current status' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')

    visit "/invoices/#{invoice.id}/edit"

    expect(page).to have_content(invoice.id)
    expect(page).to have_content(invoice.status.capitalize)
  end

  it 'disables the merchant drop-down while highlighting the right merchant' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')

    visit "/invoices/#{invoice.id}/edit"

    expect(page).to have_css('select#merchant-dropdown')
  end

  it 'shows edit an invoice status' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')

    visit "/invoices/#{invoice.id}/edit"

    select 'Returned', from: 'invoice[status]'

    click_button('Update Invoice')

    invoice = Invoice.last
    expect(invoice.status).to eq('returned')
  end

  it 'shows invoice item total' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    Item.create(name:'bork', description: 'totally borked it', unit_price: 666, merchant_id: 1, image:'borkface.jpeg')
    Item.create(name:'dork', description:'totally dorked it', unit_price: 667, merchant_id: 1, image:'dorkface.jpeg')
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 1500)
    invoice_item2 = InvoiceItem.create(item_id: 2, invoice_id: 1, quantity: 2, unit_price: 1000)

    total = ((invoice_item.quantity * invoice_item.unit_price.to_f) + (invoice_item2.quantity * invoice_item2.unit_price.to_f)) / 100
    visit "/invoices/#{invoice.id}/edit"

    expect(page).to have_content(total)
  end
end
