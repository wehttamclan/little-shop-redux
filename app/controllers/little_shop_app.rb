class LittleShopApp < Sinatra::Base
  get '/merchants/index' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end
end
