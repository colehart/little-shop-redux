RSpec.describe 'A user visits merchants dashboard' do
  it 'shows a headline' do
    page_content = 'Merchants Dashboard'
    merchant = Merchant.create(name: 'borks r us')

    visit '/merchants-dashboard'

    expect(page).to have_content(page_content)
  end

  # it 'shows total item count' do
  #   merchant = Merchant.create(name: 'borks r us')
  #   Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
  #   Item.create(name: 'gork', description: 'totally gorked it', unit_price: 666, merchant_id: merchant.id, image: 'gorkface.jpeg')
  #
  #   visit '/merchants-dashboard'
  #   expect(page).to have_content(Item.count)
  # end
  #
  # it 'shows average price per item' do
  #   merchant = Merchant.create(name: 'borks r us')
  #   Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
  #   Item.create(name: 'gork', description: 'totally gorked it', unit_price: 666, merchant_id: merchant.id, image: 'gorkface.jpeg')
  #   visit '/merchants-dashboard'
  #
  #   expect(page).to have_content(Item.average(:unit_price))
  # end
  #
  # it 'shows item by age' do
  #   merchant = Merchant.create(name: 'borks r us')
  #   item1 = Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
  #   item2 = Item.create(name: 'gork', description: 'totally gorked it', unit_price: 666, merchant_id: merchant.id, image: 'gorkface.jpeg', created_at: '2016-01-11 11:51:37 UTC')
  #   visit '/merchants-dashboard'
  #
  #   expect(page).to have_content(item2.name)
  #   expect(page).to have_content(item1.name)
  # end
  #
  # it 'links to the newest item' do
  #   merchant = Merchant.create(name: 'borks r us')
  #   item1 = Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
  #   item2 = Item.create(name: 'gork', description: 'totally gorked it', unit_price: 666, merchant_id: merchant.id, image: 'gorkface.jpeg', created_at: '2016-01-11 11:51:37 UTC')
  #   visit '/merchants-dashboard'
  #
  #   click_link("#{item1.name}")
  #   expect(current_path).to eq("/merchants/#{item1.id}")
  # end
  #
  # it 'links to the oldest item' do
  #   merchant = Merchant.create(name: 'borks r us')
  #   item1 = Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
  #   item2 = Item.create(name: 'gork', description: 'totally gorked it', unit_price: 666, merchant_id: merchant.id, image: 'gorkface.jpeg', created_at: '2016-01-11 11:51:37 UTC')
  #   visit '/merchants-dashboard'
  #
  #   click_link("#{item2.name}")
  #   expect(current_path).to eq("/merchants/#{item2.id}")
  # end
end
