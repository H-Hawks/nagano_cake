class InCartProduct < ApplicationRecord
 belongs_to :product
 belongs_to :end_user
 
 has_one_attached :image
 
 def subtotal
  product.add_tax_price * quantity
 end

end
