RSpec.describe 'A user visits items page' do
  it 'shows a headline of items' do
    visit '/items'

    expect(page).to have_content('Items')
  end
  
end
