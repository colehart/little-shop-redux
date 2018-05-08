RSpec.describe 'A user visits create new item page' do
  it 'shows a headline create new item' do
    visit '/items/new'

    expect(page).to have_content('Create New Item')
  end

  it 'shows a merchant drop down menu' do
    merchant1 = Merchant.create(name: 'Borks R Us')
    merchant2 = Merchant.create(name: 'Borker King')
    visit '/items/new'

    within('.merchant-dropdown') do
      expect(page).to have_content(merchant1.name)
      expect(page).to have_content(merchant2.name)
    end
  end

  it 'creates a new item' do
    merchant = Merchant.create(name: 'Borks R Us')
    visit '/items/new'

    within('.merchant-dropdown') do
      find("option[value='#{merchant.id}']").click
    end

    name = 'Steven Tyler'
    fill_in('item[name]', with: name)
    description = 'Super great action doll!'
    fill_in('item[description]', with: description)
    fill_in('item[unit_price]', with: 1_000_000)
    fill_in('item[image]', with: 'image.jpeg')

    click_button('Create Item')

    item = Item.first
    expect(item.name).to eq(name)
    expect(item.description).to eq(description)
  end
end
