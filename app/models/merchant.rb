class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  validates_presence_of :name

  def self.find_merchant_with_most_items
    select('merchants.*, count(items.id) as item_count')
    .joins(:items)
    .group('merchants.id')
    .order('item_count desc')
    .first
  end

  def avg_item_price
    items.average(:price)
  end

  def total_cost_of_items
    items.sum(:price) / 100.0
  end
end
