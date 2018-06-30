class Item < ActiveRecord::Base
  has_many :invoices, through: :invoice_items
  belongs_to :merchant
  
  validates_presence_of :title, :description, :price, :image
end
