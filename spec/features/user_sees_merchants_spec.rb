RSpec.describe 'A user visits merchants page' do
  context 'they visit the merchant page' do
    it 'they see an index of merchants' do
      visit '/merchants'

      expect(page).to have_content('Merchants')

    end
  end
end
