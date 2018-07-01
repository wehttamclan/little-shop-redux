class Item < ActiveRecord::Base
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  validates_presence_of :title, :description, :price, :image

  def self.total_count
    all.count
  end

  def self.avg_price
    average(:price) / 100
  end

  def self.newest
    order(:created_at).last
  end

  def self.oldest
    order(:created_at).first
  end

  def self.find_highest_priced_item
    all.find_by(price: max_price)
  end

  def self.max_price
    all.maximum(:price)
  end

  private_class_method :max_price
end
