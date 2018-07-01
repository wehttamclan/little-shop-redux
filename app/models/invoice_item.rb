class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  validates_presence_of :item_id, :invoice_id, :quantity, :unit_price

  def self.highest_price
    order(:unit_price).last.id
  end

  def self.lowest_price
    order(:unit_price).first.id
  end

  def self.highest_quantity
    order(:quantity).last.id
  end

  def self.lowest_quantity
    order(:quantity).first.id
  end
end
