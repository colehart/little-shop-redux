RSpec.describe 'A user visits a single item page' do
  it 'shows item details' do
    merchant = Merchant.create(name: 'borks r us')
    item = Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:merchant.id, image:'borkface.jpeg')
    visit "/items/#{item.id}"

    expect(page).to have_content(item.name)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.unit_price.to_f/100)
    expect(page).to have_content(merchant.name)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.description)

  end
end
