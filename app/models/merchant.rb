# Merchant model
class Merchant < ActiveRecord::Base
  validates_presence_of :name

  has_many :invoices
  has_many :items

  def merchant_items
    Item.where(merchant_id: self.id).count
  end

  def self.merchant_with_most_items
    Merchant.all.sort_by(&:merchant_items).reverse.first
  end
end
