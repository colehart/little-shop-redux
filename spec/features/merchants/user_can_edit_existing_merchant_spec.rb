RSpec.describe 'A user can edit a merchant' do
  it 'they see a page to edit merchants' do
    name = 'Cole'
    merchant = Merchant.create(name: name)
    path = "/merchants/#{merchant.id}/edit"
    visit path

    expect(page).to have_content("Edit #{name}")
  end

  it 'they can edit a merchant name' do
    merchant = Merchant.create(name: 'Cole')
    path = "/merchants/#{merchant.id}/edit"
    visit path

    new_name = 'Steven Tyler'
    fill_in('merchant[name]', with: new_name)
    click_button('Update Merchant')
    merchant = Merchant.first
    expect(merchant.name).to eq(new_name)
  end
end
