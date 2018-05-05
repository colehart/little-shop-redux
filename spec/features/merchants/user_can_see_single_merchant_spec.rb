RSpec.describe 'A user can see one merchant' do
  it 'shows a page with one merchant' do
    name = 'Cole'
    merchant = Merchant.create(name: name)
    visit "/merchants/#{merchant.id}"
    expect(page).to have_content(merchant.name)
  end

  it 'shows edit button that redirects to edit merchant' do
    merchant = Merchant.create(name: 'Cole')
    visit "/merchants/#{merchant.id}"

    click_link('Edit')
    expect(current_path).to eq('/merchants/1/edit')
  end

  it 'shows delete button that destroys merchant and redirects to index' do
    merchant = Merchant.create(name: 'Cole')
    visit "/merchants/#{merchant.id}"

    click_link('Delete')
    expect(current_path).to eq('/merchants')
    expect(page).to_not have_content(merchant)
  end
end
