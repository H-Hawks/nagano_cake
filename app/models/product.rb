class Product < ApplicationRecord
  has_one_attached :image
  
  has_many :order_details,dependent: :destroy
  has_many :in_cart_products,dependent: :destroy
  belongs_to :genre

def add_tax_price
  (self.non_taxed_price * 1.10).round
end
end
