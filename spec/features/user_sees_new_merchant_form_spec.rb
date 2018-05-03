RSpec.describe 'A user sees new merchant page' do
  it 'they see a create new merchant page' do
    visit '/merchants/new'

    expect(page).to have_content('Create New Merchant')
    expect(page).to have_content('Name')
  end

  it 'they can create new merchant' do
    visit '/merchants/new'

    fill_in('merchant[name]', with: 'Steven Tyler')
    click_button('Create Merchant')
    merchant = Merchant.first
    expect(merchant.name).to eq('Steven Tyler')
  end

  # it 'they can reset their form' do
  #   visit '/merchants/new'
  #
  #   fill_in('merchant[name]', with: 'Steven Tyler')
  #   click_button('Cancel')
  # end

  # it 'they can click on create a new merchant' do
  #   visit '/merchants'
  #
  #   click_link('Create A New Merchant')
  #   expect(current_path).to eq('/merchants/new')
  # end
end
