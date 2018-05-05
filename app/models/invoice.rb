# Invoice model
class Invoice < ActiveRecord::Base
  validates_presence_of :customer_id, :merchant_id, :status
end
