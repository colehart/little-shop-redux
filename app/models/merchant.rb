# Merchant model
class Merchant < ActiveRecord::Base
  validates_presence_of :name

  has_many :invoices
  has_many :items

  def self.order_by_id
    order('id ASC')
  end

  def self.fetch_dashboard_data
    joins(:items).select('merchants.*, sum(items.unit_price) AS total_cost, avg(items.unit_price) AS avg_price, count(items.id) AS item_count').group('merchants.id')
  end

  def self.with_most_items
    fetch_dashboard_data.order('item_count DESC').limit(1)[0]
  end

  def self.with_highest_cost
    fetch_dashboard_data.order('total_cost DESC').limit(1)[0]
  end
end
