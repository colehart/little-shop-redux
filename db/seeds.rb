require 'csv'
require './app/models/merchant.rb'
require './app/models/item.rb'
require './app/models/invoice.rb'
require './app/models/invoice_item.rb'

merchant_csv = CSV.read('./data/merchants.csv', headers: true, header_converters: :symbol)

merchant_csv.each do |line|
  Merchant.create!(id:         line[:id],
                   name:       line[:name],
                   created_at: line[:created_at],
                   updated_at: line[:updated_at])
end

item_csv = CSV.read('./data/items.csv', headers: true, header_converters: :symbol)

item_csv.each do |line|
  Item.create!(id: line[:id],
                   name: line[:name],
                   description: line[:description],
                   unit_price: line[:unit_price],
                   merchant_id: line[:merchant_id],
                   image: 'http://s.newsweek.com/sites/www.newsweek.com/files/styles/lg/public/2011/10/16/1337256000000.cached_19.jpg',
                   created_at: line[:created_at],
                   updated_at: line[:updated_at])
end

invoice_csv = CSV.read('./data/invoices.csv', headers: true, header_converters: :symbol)

invoice_csv.each do |line|
  Invoice.create!(id: line[:id],
                  customer_id: line[:customer_id],
                  merchant_id: line[:merchant_id],
                  status:      line[:status],
                  created_at:  line[:created_at],
                  updated_at:  line[:updated_at])
end

invoice_item_csv = CSV.read('./data/invoice_items.csv', headers: true, header_converters: :symbol)

invoice_item_csv.each do |line|
  InvoiceItem.create!(id: line[:id],
                   item_id: line[:item_id],
                   invoice_id: line[:invoice_id],
                   quantity: line[:quantity],
                   unit_price: line[:unit_price],
                   created_at: line[:created_at],
                   updated_at: line[:updated_at])
end
