class Product < ActiveRecord::Base
  has_many :pending_purchases
  validates :name, :description, :price, presence: true
  validates :price, numericality: {greater_than: 0}
  # validates :url, :format => URI::regexp(%w(http https))
end
