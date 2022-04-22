class Product < ApplicationRecord
  has_one_attached :image
　has_many :orders
  has_many :order_details,dependent: :destroy
  has_many :in_cart_products,dependent: :destroy
  belongs_to :genre
end
