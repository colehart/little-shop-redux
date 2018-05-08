# Merchant model
class Merchant < ActiveRecord::Base
  validates_presence_of :name

  has_many :invoices
  has_many :items

  def average_item_price
    total_cost_of_items / items.count
  end

  def total_cost_of_items
    items.reduce(0) do |total, item|
      total + item.unit_price
    end
  end
end
