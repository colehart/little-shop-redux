RSpec.describe 'A user visits items page' do
  it 'shows a headline' do
    page_content = 'Items Dashboard'
    visit '/items-dashboard'

    expect(page).to have_content(page_content)
  end
  it 'shows total item count' do
    merchant = Merchant.create(name: 'borks r us')
    Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
    Item.create(name: 'gork', description: 'totally gorked it', unit_price: 666, merchant_id: merchant.id, image: 'gorkface.jpeg')

    visit '/items-dashboard'
    expect(page).to have_content(Item.count)
  end
end
