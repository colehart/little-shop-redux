# Little Shop App Controller
class LittleShopApp < Sinatra::Base
  set :method_override, true

  get '/merchants' do
    @merchants = Merchant.all.sort_by(&:id)
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
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'/merchants/edit'
  end

  put '/merchants/:id' do
    merchant = Merchant.find(params[:id])
    merchant.update(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants-dashboard' do
    @merchants = Merchant.all
    @count = Merchant.count
    # @average = Merchant.average(:unit_price)
    # @newest = Merchant.all.max_by(&:created_at)
    # @oldest = Merchant.all.min_by(&:created_at)
    erb :'/merchants/dashboard'
  end

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])
    redirect '/merchants'
  end

  get '/items' do
    @items = Item.all.sort_by(&:id)
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

  get '/items-dashboard' do
    @count = Item.count
    @average = Item.average(:unit_price)
    @newest = Item.all.max_by(&:created_at)
    @oldest = Item.all.min_by(&:created_at)
    erb :'/items/dashboard'
  end

  get '/invoices' do
    @invoices = Invoice.all.sort_by(&:id)
    erb :"invoices/index"
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    @merchant = @invoice.merchant
    @invoice_items = @invoice.invoice_items
    erb :"invoices/show"
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    @merchant = @invoice.merchant
    @invoice_items = @invoice.invoice_items
    erb :'/invoices/edit'
  end

  put '/invoices/:id' do
    invoice = Invoice.find(params[:id])
    invoice.update(params[:invoice])
    redirect '/invoices'
  end

  delete '/invoices/:id' do
    Invoice.destroy(params[:id])
    redirect '/invoices'
  end

end
