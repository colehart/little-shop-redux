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

    expect(page).to have_css('.merchant-dropdown  disabled')
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
end
