RSpec.describe 'A user can see one merchant' do
  it 'shows a page with one merchant' do
    name = 'Cole'
    merchant = Merchant.create(name: name)
    visit "/merchants/#{merchant.id}"
    expect(page).to have_content(merchant.name)
  end

  it 'shows edit button that redirects to edit merchant' do
    merchant = Merchant.create(name: 'Cole')
    visit "/merchants/#{merchant.id}"

    click_link('Edit')
    expect(current_path).to eq("/merchants/#{merchant.id}/edit")
  end

  it 'shows delete button that destroys merchant and redirects to index' do
    merchant = Merchant.create(name: 'Cole')
    visit "/merchants/#{merchant.id}"

    click_button('Delete')
    expect(current_path).to eq('/merchants')
    expect(page).to_not have_content(merchant)
  end

  it 'shows list of merchant items' do
    merchant = Merchant.create(name: 'Cole')
    item_name = 'bork'
    merchant.items.create(name: item_name, description: 'totally borked it', unit_price: 666, image: 'borkface.jpeg')
    unit_price = 1000
    merchant.items.create(name: 'dork', description: 'totally dorked it', unit_price: unit_price, image: 'dorkface.jpeg')

    visit "/merchants/#{merchant.id}"
    expect(page).to have_content(item_name)
    expect(page).to have_content(unit_price)
  end
end
