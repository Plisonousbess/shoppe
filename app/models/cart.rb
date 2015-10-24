class Cart < ActiveRecord::Base
  has_many :products, through: :pending_purchases
  has_many :pending_purchases
  belongs_to :user
end
