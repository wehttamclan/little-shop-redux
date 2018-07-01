class Item < ActiveRecord::Base
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
end
