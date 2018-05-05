RSpec.describe 'A user visits create new item page' do
  it 'shows a headline create new item' do
    visit '/items/new'

    expect(page).to have_content('Create New Item')
  end
end
