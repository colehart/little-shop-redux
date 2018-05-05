RSpec.describe 'A user can see one invoice' do
  it 'shows a page with one invoice' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    visit "/invoices/#{invoice.id}"

    expect(page).to have_content(invoice.id)
    expect(page).to have_content(invoice.status.capitalize)
  end

  it 'shows edit button that redirects to edit invoice' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    visit "/invoices/#{invoice.id}"

    click_link('Edit')
    expect(current_path).to eq('/invoices/1/edit')
  end

  it 'shows delete button that destroys invoice and redirects to index' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    visit "/invoices/#{invoice.id}"

    click_button('Delete')
    expect(current_path).to eq('/invoices')
    expect(page).to_not have_content(invoice)
  end

  it 'shows merchant name of invoice' do
    merchant = Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')

    visit "/invoices/#{invoice.id}"

    expect(page).to have_content(merchant.name)
  end
end
