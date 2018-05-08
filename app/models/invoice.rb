# Invoice model
class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id, :status

  belongs_to :merchant
  has_many :invoice_items

  def total_price
    invoice_items.reduce(0) do |total, invoice_item|
      total + (invoice_item.quantity * invoice_item.unit_price)
    end
  end

  def self.order_by_id
    order('id ASC')
  end

  def self.total_invoices_by_status(status)
    number_of_invoices_by_status = where(status: status).count
    ((number_of_invoices_by_status.to_f / count.to_f) * 100).to_i
  end

  def self.fetch_dashboard_data
    joins(:invoice_items).select('invoices.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_cost, sum(invoice_items.quantity) AS total_quantity').group('invoices.id')
  end

  def self.highest_by_unit_price
    fetch_dashboard_data.order('total_cost DESC').limit(1)[0]
  end

  def self.lowest_by_unit_price
    fetch_dashboard_data.order('total_cost ASC').limit(1)[0]
  end

  def self.highest_by_quantity
    fetch_dashboard_data.order('total_quantity DESC').limit(1)[0]
  end

  def self.lowest_by_quantity
    fetch_dashboard_data.order('total_quantity ASC').limit(1)[0]
  end
end
