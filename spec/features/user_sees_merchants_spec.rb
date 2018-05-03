RSpec.describe 'A user visits merchants page' do
  context 'they visit the merchant page' do
    it 'they see a headline of merchants' do
      visit '/merchants'

      expect(page).to have_content('Merchants')
    end

    it 'they see a list of merchant names' do
      Merchant.create(name: 'Cole', merchant_id: 1)
      visit '/merchants'

      expect(page).to have_content('Cole')
    end
  end
end
