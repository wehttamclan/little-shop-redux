class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image

  belongs_to :merchant
  has_many :invoices
end
