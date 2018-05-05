RSpec.describe 'A user can see one merchant' do
  it 'sees a page with one merchant' do
    name = 'Cole'
    merchant = Merchant.create(name: name)
    visit "/merchants/#{merchant.id}"
    expect(page).to have_content(merchant.name)
  end
end
