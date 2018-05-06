# Item class
class Item < ActiveRecord::Base
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :image

  belongs_to :merchant
  has_many :invoice_items
end
