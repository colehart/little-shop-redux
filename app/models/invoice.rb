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

  def self.total_invoices_by_status(status)
    number_of_invoices_by_status = where(status: status).count
    ((number_of_invoices_by_status.to_f / count.to_f) * 100).to_i
  end
end
