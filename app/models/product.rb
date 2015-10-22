class Product < ActiveRecord::Base
  validates :name, :description, :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :url, :format => URI::regexp(%w(http https))
end
