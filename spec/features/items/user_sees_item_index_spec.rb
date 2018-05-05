RSpec.describe 'A user visits items page' do
  it 'shows a headline of items' do
    visit '/items'

    expect(page).to have_content('Items')
  end

  it 'shows items' do
    item1 = Item.create(name:'bork', description:'totally borked it', unit_price:666, merchant_id:1, image:'borkface.jpeg')
    item2 = Item.create(name:'pork', description:'totally porked it', unit_price:667, merchant_id:2, image:'porkface.jpeg')
    item3 = Item.create(name:'dork', description:'totally dorked it', unit_price:668, merchant_id:3, image:'dorkface.jpeg')
    visit '/items'
    save_and_open_page
    expect(page).to have_content(item1.name)
    expect(page).to have_content("$#{item1.unit_price/100}")
    expect(page).to have_content(item2.name)
    expect(page).to have_content("$#{item2.unit_price/100}")
    expect(page).to have_content(item3.name)
    expect(page).to have_content("$#{item3.unit_price/100}")
  end

end
