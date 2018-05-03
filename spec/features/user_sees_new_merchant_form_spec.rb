RSpec.describe 'A user sees new merchant page' do
  it 'they see a create new merchant headline' do
    visit '/merchants/new'

    expect(page).to have_content('Create New Merchant')
  end

  # it 'they see a form' do
  #   visit '/merchants/new'
  #
  #   expect(page).to have_content('Cole')
  # end
  #
  # it 'they can click on create a new merchant' do
  #   visit '/merchants'
  #
  #   click_link('Create A New Merchant')
  #   expect(current_path).to eq('/merchants/new')
  # end
end
