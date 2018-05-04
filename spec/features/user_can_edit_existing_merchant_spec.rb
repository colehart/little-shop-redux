RSpec.describe 'A user can edit a merchant' do
  it 'they see a page to edit merchants' do
    name = 'Cole'
    merchant = Merchant.create(name: name)
    path = "/merchants/#{merchant.id}/edit"
    visit path


    expect(page).to have_content("Edit #{name}")
  end

  it 'they can edit a merchant name' do
    name = 'Cole'
    merchant = Merchant.create(name: name)
    path = "/merchants/#{merchant.id}/edit"
    visit path

    fill_in('name', with: 'Steven Tyler')
    click_button('Update Merchant')
    merchant = Merchant.first
    expect(merchant.name).to eq('Steven Tyler')
  end
#
#   it 'they can click on create a new merchant' do
#     visit '/merchants'
#
#     click_link('Create A New Merchant')
#     expect(current_path).to eq('/merchants/new')
#   end
end
