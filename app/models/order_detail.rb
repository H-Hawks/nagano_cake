class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def subtotal
    product.add_tax_price * quantity
  end
end
