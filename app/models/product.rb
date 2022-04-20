class Product < ApplicationRecord
  has_one_attached :image
  
  has_many :order_details,dependant: :destroy
  has_many :in_cart_products,dependant: :destroy
  belongs_to :genre
end
