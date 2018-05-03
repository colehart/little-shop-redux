RSpec.describe 'A user visits merchants page' do
  it 'shows a headline of merchants' do
    visit '/merchants'

    expect(page).to have_content('Merchants')
  end

  it 'shows a list of merchant names' do
    Merchant.create(name: 'Cole')
    visit '/merchants'

    expect(page).to have_content('Cole')
  end

  it 'can direct to create a new merchant page' do
    visit '/merchants'

    click_link('Create A New Merchant')
    expect(current_path).to eq('/merchants/new')
  end

  it 'can direct to edit merchant page' do
    Merchant.create(name: 'Cole')
    visit '/merchants'

    click_link('Edit')
    expect(current_path).to eq('/merchants/1/edit')
  end
end
