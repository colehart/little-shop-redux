RSpec.describe 'A user visits merchants page' do
  it 'shows a headline of merchants' do
    visit '/merchants'

    expect(page).to have_content('Merchants')
  end

  it 'shows a list of merchant names' do
    name = 'Cole'
    Merchant.create(name: name)
    visit '/merchants'

    expect(page).to have_content(name)
  end

  it 'can direct to create a new merchant page' do
    visit '/merchants'

    click_link('Create A New Merchant')
    expect(current_path).to eq('/merchants/new')
  end

  it 'can direct to edit merchant page' do
    merchant = Merchant.create(name: 'Cole')
    visit '/merchants'

    click_link('Edit')
    expect(current_path).to eq("/merchants/#{merchant.id}/edit")
  end

  it 'can delete a merchant' do
    Merchant.create(name: 'Cole')
    visit '/merchants'

    click_button('Delete')
    expect(page).to_not have_content('Cole')
    expect(Merchant.count).to eq(0)
  end

  it 'can view one merchant' do
    merchant = Merchant.create(name: 'Manoj')
    visit '/merchants'

    click_link(merchant.name)
    expect(current_path).to eq("/merchants/#{merchant.id}")
  end
end
