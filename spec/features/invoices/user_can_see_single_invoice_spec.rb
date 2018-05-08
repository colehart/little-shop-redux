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
    expect(current_path).to eq("/invoices/#{invoice.id}/edit")
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

    expect(page).to have_content(invoice_item.item_id)
    expect(page).to have_content(item.name)
    expect(page).to have_content(invoice_item.quantity)
    expect(page).to have_content(invoice_item.unit_price.to_f/100)
  end

  it 'shows invoice item total' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    Item.create(name:'dork', description:'totally dorked it', unit_price:667, merchant_id:1, image:'dorkface.jpeg')
    invoice_item = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 3, unit_price: 1500)
    invoice_item2 = InvoiceItem.create(item_id: 2, invoice_id: 1, quantity: 2, unit_price: 1000)

    total = ((invoice_item.quantity * invoice_item.unit_price.to_f) + (invoice_item2.quantity * invoice_item2.unit_price.to_f))/100
    visit "/invoices/#{invoice.id}"

    expect(page).to have_content(total)
  end
end
