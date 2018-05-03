# Little Shop App Controller
class LittleShopApp < Sinatra::Base
  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  post '/merchants' do
    @merchant = Merchant.create(name: params[:name])
    redirect '/merchants'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'/merchants/edit'
  end
end
