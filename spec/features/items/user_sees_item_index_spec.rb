RSpec.describe 'A user visits items page' do
  it 'shows a headline of items' do
    visit '/items'

    expect(page).to have_content('Items')
  end

  it 'has a link to create a new item' do
    visit '/items'

    expect(page).to have_content('Create A New Item')
  end

  it 'can direct to create a new item page' do
    visit '/items'

    click_link('Create A New Item')
    expect(current_path).to eq('/items/new')
  end

  it 'shows items' do
    item1 = Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: 1, image: 'borkface.jpeg')
    item2 = Item.create(name: 'pork', description: 'totally porked it', unit_price: 667, merchant_id: 2, image: 'porkface.jpeg')
    item3 = Item.create(name: 'dork', description: 'totally dorked it', unit_price: 668, merchant_id: 3, image: 'dorkface.jpeg')
    visit '/items'
    expect(page).to have_content(item1.name)
    expect(page).to have_content("$#{item1.unit_price.to_f / 100}")
    expect(page).to have_content(item2.name)
    expect(page).to have_content("$#{item2.unit_price.to_f / 100}")
    expect(page).to have_content(item3.name)
    expect(page).to have_content("$#{item3.unit_price.to_f / 100}")
  end

  it 'links to item show page' do
    Merchant.create(name: 'hi')
    item = Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: 1, image:'borkface.jpeg')
    visit '/items'
    click_link(item.name)
    expect(current_path).to eq("/items/#{item.id}")
  end

  it 'links to item dashboard page' do
    merchant = Merchant.create(name: 'borks r us')
    Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
    visit '/items'

    click_link('Dashboard')
    expect(current_path).to eq('/items-dashboard')
  end
end
