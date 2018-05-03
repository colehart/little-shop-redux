# RSpec.describe 'A user can edit a merchant' do
#   it 'they see a headline of merchants' do
#     visit '/merchants'
#
#     expect(page).to have_content('Merchants')
#   end
#
#   it 'they see a list of merchant names' do
#     Merchant.create(name: 'Cole')
#     visit '/merchants'
#
#     expect(page).to have_content('Cole')
#   end
#
#   it 'they can click on create a new merchant' do
#     visit '/merchants'
#
#     click_link('Create A New Merchant')
#     expect(current_path).to eq('/merchants/new')
#   end
# end
