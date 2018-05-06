# Little Shop App Controller
class LittleShopApp < Sinatra::Base
  set :method_override, true

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

  get '/merchants/:id' do
    @merchant = Merchant.find(params['id'])
    erb :"merchants/merch_page"
  end

  put '/merchants/:id' do
    merchant = Merchant.find(params['id'])
    merchant.update(params['merchant'])
    redirect '/merchants'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'/merchants/edit'
  end

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])
    redirect '/merchants'
  end

  get '/items' do
    @items = Item.all
    erb :'/items/index'
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :'/items/new'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    @merchant = Merchant.find(@item.merchant_id)
    erb :'/items/show'
  end

  post '/items' do
    @item = Item.create(params[:item])
    redirect '/items'
  end

  get '/items/:id/edit' do
    @merchants = Merchant.all
    @item = Item.find(params[:id])
    erb :'/items/edit'
  end

  put '/items/:id' do
    item = Item.find(params[:id])
    item.update(params[:item])
    redirect '/items'
  end

  delete '/items/:id' do
    Item.destroy(params[:id])
    redirect '/items'
  end
end
