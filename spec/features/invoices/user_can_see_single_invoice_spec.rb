RSpec.describe 'A user can see one invoice' do
  it 'shows a page with one invoice' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 23, unit_price: 1500)

    visit "/invoices/#{invoice.id}"

    expect(page).to have_content(invoice.id)
    expect(page).to have_content(invoice.status.capitalize)
  end

  it 'shows edit button that redirects to edit invoice' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 23, unit_price: 1500)

    visit "/invoices/#{invoice.id}"

    click_link('Edit')
    expect(current_path).to eq('/invoices/1/edit')
  end

  it 'shows delete button that destroys invoice and redirects to index' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 23, unit_price: 1500)

    visit "/invoices/#{invoice.id}"

    click_button('Delete')
    expect(current_path).to eq('/invoices')
    expect(page).to_not have_content(invoice)
  end

  it 'shows merchant name of invoice' do
    merchant = Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 23, unit_price: 1500)

    visit "/invoices/#{invoice.id}"

    expect(page).to have_content(merchant.name)
  end

  it 'shows a table of invoice items' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    item = Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 23, unit_price: 1500)

    visit "/invoices/#{invoice.id}"

    save_and_open_page

    expect(page).to have_content(invoice_item.item_id)
    expect(page).to have_content(item.name)
    expect(page).to have_content(invoice_item.quantity)
    expect(page).to have_content(invoice_item.unit_price)
  end
end
