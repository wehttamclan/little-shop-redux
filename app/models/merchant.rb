class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  validates_presence_of :name

  def self.merchant_with_most_items

  end

  def avg_item_price
    items.average(:price)
  end

  def total_cost_of_items
    items.sum(:price)
  end
end
