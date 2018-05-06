RSpec.describe 'A user visits edit item page' do
  it 'shows a headline of Edit' do
    item = Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    visit "/items/#{item.id}/edit"

    expect(page).to have_content('Edit')
  end

  it 'edits a updates an item' do
    merchant = Merchant.create(name: 'borks r us')

    item = Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    visit "/items/#{item.id}/edit"

    fill_in('item[name]', with: 'Steven Tyler')
    fill_in('item[unit_price]', with: 1_000_000)
    fill_in('item[image]', with:'image.jpeg')
    # within('.merchant-dropdown') do
    #   find("option[value='1']").click
    # end - Add more merchants, set default
    expect(page).to have_content('totally borked it')
    click_button('Update Item')
    item1 = Item.find(item.id)
    expect(item1.name).to eq('Steven Tyler')
    expect(item1.description).to eq('totally borked it')
    expect(item1.image).to eq('image.jpeg')
    expect(item1.merchant_id).to eq(1)
    expect(item1.id).to eq(1)
  end

end
