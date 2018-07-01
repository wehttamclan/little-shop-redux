class Invoice < ActiveRecord::Base
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :merchant

  validates_presence_of :merchant_id, :status

  def total_price
    invoice_items.map do |ii|
      ii.quantity * ii.unit_price
    end.sum
  end

  def self.pending
    all = Invoice.all.count
    status = where(status: 'pending').count
    ((status.to_f / all.to_f) * 100).to_i
  end

  def self.shipped
    all = Invoice.all.count
    status = where(status: 'shipped').count
    ((status.to_f / all.to_f) * 100).to_i
  end

  def self.returned
    all = Invoice.all.count
    status = where(status: 'returned').count
    ((status.to_f / all.to_f) * 100).to_i
  end
end
