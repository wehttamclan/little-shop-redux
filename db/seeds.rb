require './app/models/merchant.rb'
require './app/models/item.rb'
require './app/models/invoice.rb'
require './app/models/invoice_item.rb'
require 'csv'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |merchant|
  Merchant.create(merchant.to_h)
end

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |invoice|
  invoice.delete(:customer_id)
  Invoice.create(invoice.to_h)
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |item|
  Item.create(id: item[:id],
              title: item[:name],
              description: item[:description],
              price: item[:unit_price],
              image: './app/public/tulips.jpg',
              created_at: item[:created_at],
              updated_at: item[:updated_at],
              merchant_id: item[:merchant_id])
end

CSV.foreach('./data/invoice_items.csv', headers: true, header_converters: :symbol) do |invoice_item|
  InvoiceItem.create(invoice_item.to_h)
end
