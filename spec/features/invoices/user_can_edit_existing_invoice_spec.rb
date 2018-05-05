RSpec.describe 'A user can edit an invoice' do
  it 'they see a page to edit invoices' do
    invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    visit "/invoices/#{invoice.id}/edit"

    expect(page).to have_content(invoice.id)
    expect(page).to have_content(invoice.status.capitalize)
  end

  # it 'they can edit a invoice status' do
  #   invoice = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
  #
  #   path = "/invoices/#{invoice.id}/edit"
  #   visit path
  #
  #   fill_in('invoice[name]', with: 'Steven Tyler')
  #   click_button('Update Invoice')
  #   invoice = Invoice.first
  #   expect(invoice.name).to eq('Steven Tyler')
  # end
end
