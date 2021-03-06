require 'pry'

class LittleShopApp < Sinatra::Base
  get '/' do
    erb :'littleshop/dashboard'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items-dashboard' do
    @items = Item.all
    @avg_price_of_items = @items.avg_price
    erb :'items/dashboard'
  end

  get '/items/new' do
    erb :'items/new'
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    @items_merchant = @item.merchant
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  put '/items/:id' do |id|
    Item.update(id.to_i, params[:item])
    redirect "/items/#{id}"
  end

  delete '/items/:id' do |id|
    Item.destroy(id)
    redirect '/items'
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{id}"
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id)
    redirect '/merchants'
  end

  get '/merchants-dashboard' do
    @merchants = Merchant.all.includes(:items)
    @merchant_with_most_items = Merchant.find_merchant_with_most_items
    @merchant_name_with_highest_priced_item = Item.find_highest_priced_item.merchant.name
    @merchant_with_highest_price_item = Item.find_highest_priced_item.merchant
    erb :'merchants/dashboard'
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :'invoices/index'
  end

  get '/invoices-dashboard' do
    @invoices = Invoice.all.includes(:invoice_items)
    @invoice_items = InvoiceItem.all
    @highest_price = @invoice_items.highest_price
    @lowest_price = @invoice_items.lowest_price
    @highest_quantity = @invoice_items.highest_quantity
    @lowest_quantity = @invoice_items.lowest_quantity
    erb :'invoices/dashboard'
  end

  patch '/invoices/:id' do
    invoice = Invoice.find(params[:id])
    invoice.update(params[:invoice])
    redirect "/invoices/#{invoice.id}"
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    erb :'invoices/show'
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    erb :'invoices/edit'
  end

  delete '/invoices/:id' do |id|
    Invoice.destroy(id)
    redirect '/invoices'
  end
end
