RSpec.describe 'A user visits invoice dashboard' do
  it 'shows a headline' do
    page_content = 'Invoices Dashboard'
    Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    Invoice.create(customer_id: 2, merchant_id: 2, status: 'shipped')
    Invoice.create(customer_id: 3, merchant_id: 3, status: 'pending')
    Invoice.create(customer_id: 4, merchant_id: 4, status: 'returned')

    visit '/invoices-dashboard'

    expect(page).to have_content(page_content)
  end

  it 'shows pending percentage' do
    page_content = '50%'
    Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    Invoice.create(customer_id: 2, merchant_id: 2, status: 'shipped')
    Invoice.create(customer_id: 3, merchant_id: 3, status: 'pending')
    Invoice.create(customer_id: 4, merchant_id: 4, status: 'returned')

    visit '/invoices-dashboard'

    save_and_open_page

    expect(page).to have_content(page_content)
  end

  # it 'shows pending percentage' do
  #   page_content = '50%'
  #   invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
  #   invoice2 = Invoice.create(customer_id: 2, merchant_id: 2, status: 'shipped')
  #   invoice3 = Invoice.create(customer_id: 3, merchant_id: 3, status: 'pending')
  #   invoice4 = Invoice.create(customer_id: 4, merchant_id: 4, status: 'returned')
  #
  #   visit '/invoices-dashboard'
  #   expect(page).to have_content(page_content)
  # end
end
