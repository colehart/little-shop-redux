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

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])
    redirect '/merchants'
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :"invoices/index"
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    @merchant = @invoice.merchant
    erb :"invoices/show"
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    @merchant = @invoice.merchant
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
