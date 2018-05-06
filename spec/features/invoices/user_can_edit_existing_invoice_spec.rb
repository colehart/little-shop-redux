RSpec.describe 'A user can edit an invoice' do
  it 'shows invoice id headline with current status' do
    Merchant.create(name: 'Cole')
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')

    visit "/invoices/#{invoice.id}/edit"

    expect(page).to have_content(invoice.id)
    expect(page).to have_content(invoice.status.capitalize)
  end

# Unsure of how to write a Capy test for disabled merchants dropdown
  # it 'disables the merchant drop-down while highlighting the right merchant' do
  #   merchant = Merchant.create(name: 'Cole')
  #   invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
  #
  #   visit "/invoices/#{invoice.id}/edit"
  #
  #   save_and_open_page
  #   expect(page).to have_css('.merchant-dropdown = disabled')
  # end

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
