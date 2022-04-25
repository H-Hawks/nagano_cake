class Product < ApplicationRecord


has_one_attached :image

has_many :order_details,dependent: :destroy
has_many :in_cart_products,dependent: :destroy
belongs_to :genre

validates :name, presence: true
validates :description,presence: true
validates :image,presence: true
validates :genre_id,presence: true
validates :non_taxed_price,presence: true
validates :is_active,inclusion:{in:[true,false]}



def add_tax_price
  (self.non_taxed_price * 1.10).round
end
end
