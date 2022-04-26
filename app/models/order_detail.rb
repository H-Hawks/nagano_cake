class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
   enum production_status: {
     cannot_be_manufactured: 0,
     waiting_for_production: 1,
     in_productions: 2,
     production_completed: 3,
   }
  
  def subtotal
    product.add_tax_price * quantity
  end
end
