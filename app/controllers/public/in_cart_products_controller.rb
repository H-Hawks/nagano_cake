class Public::InCartProductsController < ApplicationController
 def create
  @in_cart_product = InCartProduct.new(in_cart_product_params)
  @in_cart_product.end_user_id = current_end_user.id
  @in_cart_product.save!
  redirect_to in_cart_products_path
 end
  
 def index
  @in_cart_products = InCartProduct.all
 end
  
private
  def in_cart_product_params
    params.require(:in_cart_product).permit(:product_id, :quantity,)
  end
end
