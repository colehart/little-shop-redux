require 'csv'
require './app/models/merchant.rb'
require './app/models/item.rb'

csv = CSV.read('./data/merchants.csv', headers: true, header_converters: :symbol)

csv.each do |line|
  Merchant.create!(id: line[:id],
                   name: line[:name],
                   created_at: line[:created_at],
                   updated_at: line[:updated_at])
end

item_csv = CSV.read('./data/items.csv', headers: true, header_converters: :symbol)

item_csv.each do |line|
  Item.create!(id: line[:id],
                   name: line[:name],
                   description: line[:description],
                   unit_price: line[:unit_price],
                   image: 'http://s.newsweek.com/sites/www.newsweek.com/files/styles/lg/public/2011/10/16/1337256000000.cached_19.jpg',
                   created_at: line[:created_at],
                   updated_at: line[:updated_at])
end
