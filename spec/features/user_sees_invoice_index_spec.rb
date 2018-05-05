# invoice index tests
RSpec.describe 'A user visits invoices page' do
  it 'shows a headline of invoices' do
    headline = 'Invoices'

    visit '/invoices'

    expect(page).to have_content(headline)
  end

  it 'shows a list of invoice names' do
    invoice = Invoice.create(customer_id: 1, merchant_id: 3434, status: 'shipped')

    visit '/invoices'

    expect(page).to have_content(invoice.id)
  end

  it 'can view one invoice' do
    invoice = Invoice.create(customer_id: 1, merchant_id: 3434, status: 'shipped')

    visit '/invoices'

    click_link(invoice.id)
    expect(current_path).to eq("/invoices/#{invoice.id}")
  end

  it 'can direct to edit invoice page' do
    Invoice.create(customer_id: 1, merchant_id: 3434, status: 'shipped')

    visit '/invoices'

    click_link('Edit')
    expect(current_path).to eq('/invoices/1/edit')
  end

  it 'can delete an invoice' do
    invoice = Invoice.create(customer_id: 1, merchant_id: 3434, status: 'shipped')

    visit '/invoices'

    click_button('Delete')
    expect(page).to_not have_content(invoice.id)
    expect(Invoice.count).to eq(0)
  end
end
