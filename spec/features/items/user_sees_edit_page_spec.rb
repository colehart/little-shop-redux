RSpec.describe 'A user visits edit item page' do
  it 'shows a headline of Edit' do
    item = Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    visit "/items/#{item.id}/edit"

    expect(page).to have_content('Edit')
  end

  it 'edits a updates an item' do
    Merchant.create(name: 'borks r us')
    Merchant.create(name: 'borker king')
    description = 'totally borked it'
    item = Item.create(name: 'bork', description: description, unit_price: 666, merchant_id: 1, image: 'borkface.jpeg')
    visit "/items/#{item.id}/edit"

    new_name = 'Steven Tyler'
    fill_in('item[name]', with: new_name)
    fill_in('item[unit_price]', with: 1_000_000)
    image = 'image.jpg'
    fill_in('item[image]', with: image)

    select 'borker king', from: 'item[merchant_id]'

    expect(page).to have_content(description)
    click_button('Update Item')
    item1 = Item.find(item.id)
    expect(item1.name).to eq(new_name)
    expect(item1.description).to eq(description)
    expect(item1.image).to eq(image)
    expect(item1.merchant_id).to eq(2)
    expect(item1.id).to eq(1)
  end
end
