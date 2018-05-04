require 'csv'
require './app/models/merchant.rb'

csv = CSV.read('./data/merchants.csv', headers: true, header_converters: :symbol)

csv.each do |line|
  Merchant.create!(id: line[:id],
                   name: line[:name],
                   created_at: line[:created_at],
                   updated_at: line[:updated_at])
end
