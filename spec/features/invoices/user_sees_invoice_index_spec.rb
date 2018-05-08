# invoice index tests
RSpec.describe 'A user visits invoices page' do
  it 'shows a headline of invoices' do
    headline = 'Invoices'

    visit '/invoices'

    expect(page).to have_content(headline)
  end

  it 'shows a list of invoice names' do
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')

    visit '/invoices'

    expect(page).to have_content(invoice.id)
  end

  it 'can view one invoice' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')

    visit '/invoices'

    click_link(invoice.id)
    expect(current_path).to eq("/invoices/#{invoice.id}")
  end

  it 'can direct to edit invoice page' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')

    visit '/invoices'

    click_link('Edit')
    expect(current_path).to eq("/invoices/#{invoice.id}/edit")
  end

  it 'can delete an invoice' do
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')

    visit '/invoices'

    click_button('Delete')
    expect(page).to_not have_content(invoice.id)
    expect(Invoice.count).to eq(0)
  end

  it 'links to invoice dashboard' do
    invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    invoice1.invoice_items.create(item_id: 1, quantity: 3, unit_price: 2500)
    
    visit '/invoices'

    click_link('Dashboard')
    expect(current_path).to eq('/invoices-dashboard')
  end
end
