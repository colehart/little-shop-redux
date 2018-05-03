class LittleShopApp < Sinatra::Base

  get '/merchants' do
    # require 'pry'; binding.pry
    Merchant.create(name: 'Cole', merchant_id: 1)

    @merchants = Merchant.all
    erb :"merchants/index"
  end


end
