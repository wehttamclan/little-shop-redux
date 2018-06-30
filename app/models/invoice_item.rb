class InvoiceItem < ActiveRecord::Base
  validates_presence_of :item_id, :invoice_id, :quantity, :unit_price
end
