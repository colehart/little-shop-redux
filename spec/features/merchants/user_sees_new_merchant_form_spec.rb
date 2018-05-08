RSpec.describe 'A user sees new merchant page' do
  it 'they see a create new merchant page' do
    visit '/merchants/new'

    expect(page).to have_content('Create New Merchant')
    expect(page).to have_content('Name')
  end

  it 'they can create new merchant' do
    visit '/merchants/new'

    name = 'Steven Tyler'
    fill_in('name', with: name)
    click_button('Create Merchant')
    merchant = Merchant.first
    expect(merchant.name).to eq(name)
  end

  it 'they can reset their form' do
    visit '/merchants/new'
    click_link('Cancel')
    expect(current_path).to eq('/merchants')
  end

  it 'redirects on a failed creation' do
    visit '/merchants/new'

    click_button('Create Merchant')
    expect(Merchant.count).to eq(0)
    expect(current_path).to eq('/merchants')
  end
end
