class OrderDetail < ApplicationRecord
  belongs_to :end_users
  belongs_to :orders

  def subtotal
    product.add_tax_price * quantity
  end
end
