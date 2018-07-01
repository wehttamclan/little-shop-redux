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
end
