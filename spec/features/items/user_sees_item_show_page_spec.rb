RSpec.describe 'A user visits a single item page' do
  it 'shows item details' do
    merchant = Merchant.create(name: 'borks r us')
    item = Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
    visit "/items/#{item.id}"

    expect(page).to have_content(item.name)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.unit_price.to_f/100)
    expect(page).to have_content(merchant.name)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.description)
  end

  it 'can go to edit item page' do
    merchant = Merchant.create(name: 'borks r us')
    item = Item.create(name:'bork', description:'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
    visit "/items/#{item.id}"

    click_link('Edit')
    expect(current_path).to eq("/items/#{item.id}/edit")
  end

  it 'can delete from item show page' do
    merchant = Merchant.create(name: 'borks r us')
    item = Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant.id, image: 'borkface.jpeg')
    visit "/items/#{item.id}"

    click_button('Delete')
    expect(Item.count).to eq(0)
  end
end
