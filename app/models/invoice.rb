class Invoice < ActiveRecord::Base
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :merchant

  validates_presence_of :merchant_id, :status
end
