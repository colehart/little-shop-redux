RSpec.describe 'A user visits invoice dashboard' do
  it 'shows a headline' do
    page_content = 'Invoices Dashboard'
    invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    invoice2 = Invoice.create(customer_id: 2, merchant_id: 2, status: 'shipped')
    Invoice.create(customer_id: 3, merchant_id: 3, status: 'pending')
    Invoice.create(customer_id: 4, merchant_id: 4, status: 'returned')
    invoice1.invoice_items.create(item_id: 1, quantity: 3, unit_price: 2500)
    invoice2.invoice_items.create(item_id: 2, quantity: 2, unit_price: 25000)

    visit '/invoices-dashboard'

    expect(page).to have_content(page_content)
  end

  it 'shows pending percentage' do
    page_content = '50%'
    invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    invoice2 = Invoice.create(customer_id: 2, merchant_id: 2, status: 'shipped')
    Invoice.create(customer_id: 3, merchant_id: 3, status: 'pending')
    Invoice.create(customer_id: 4, merchant_id: 4, status: 'returned')
    invoice1.invoice_items.create(item_id: 1, quantity: 3, unit_price: 2500)
    invoice2.invoice_items.create(item_id: 2, quantity: 2, unit_price: 25000)

    visit '/invoices-dashboard'

    expect(page).to have_content(page_content)
  end

  it 'shows highest and lowest invoice by unit prices' do
    invoice1 = Invoice.create(customer_id: 1, merchant_id: 1, status: 'shipped')
    invoice2 = Invoice.create(customer_id: 2, merchant_id: 2, status: 'pending')
    invoice1.invoice_items.create(item_id: 1, quantity: 3, unit_price: 2500)
    invoice2.invoice_items.create(item_id: 2, quantity: 2, unit_price: 25000)

    visit '/invoices-dashboard'

    within('article#unit_prices') do
      within('section.highest') do
        expect(page).to have_content("#{invoice2.id}")
      end
      within ('section.lowest') do
        expect(page).to have_content("#{invoice1.id}")
      end
    end
  end
end
