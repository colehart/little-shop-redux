require 'csv'
require './app/models/merchant.rb'
require './app/models/invoice.rb'

csv = CSV.read('./data/merchants.csv', headers: true, header_converters: :symbol)

csv.each do |line|
  Merchant.create!(id:         line[:id],
                   name:       line[:name],
                   created_at: line[:created_at],
                   updated_at: line[:updated_at])
end

csv = CSV.read('./data/invoices.csv', headers: true, header_converters: :symbol)

csv.each do |line|
  Invoice.create!(id: line[:id],
                  customer_id: line[:customer_id],
                  merchant_id: line[:merchant_id],
                  status:      line[:status],
                  created_at:  line[:created_at],
                  updated_at:  line[:updated_at])
end
