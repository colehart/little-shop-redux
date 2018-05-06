# Invoice model
class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id, :status

  belongs_to :merchant
  has_many :items
end
