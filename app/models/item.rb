# Item class
class Item < ActiveRecord::Base
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :image

  belongs_to :merchant
  has_many :invoice_items

  def self.order_by_id
    order('id ASC')
  end

  def self.average_unit_price
    average(:unit_price)
  end

  def self.newest
    all.max_by(&:created_at)
  end

  def self.oldest
    all.min_by(&:created_at)
  end
end
