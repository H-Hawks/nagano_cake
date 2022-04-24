class Public::InCartProductsController < ApplicationController
 def create
  if current_end_user.in_cart_products.find_by(product_id: in_cart_product_params[:product_id]).present?
   cart_product = current_end_user.in_cart_products.find_by(product_id: in_cart_product_params[:product_id])
   cart_product.quantity += in_cart_product_params[:quantity].to_i
   cart_product.save
   redirect_to in_cart_products_path
  else
   @in_cart_product = InCartProduct.new(in_cart_product_params)
   @in_cart_product.end_user_id = current_end_user.id
   @in_cart_product.save
   redirect_to in_cart_products_path
  end
 end
  
 def index
  @in_cart_products = InCartProduct.all
  @sum = 0 
 end
 
 def update
  in_cart_product = InCartProduct.find(params[:id])
  #binding.pry
  in_cart_product.update(update_in_cart_product_params)
  redirect_to in_cart_products_path
 end
 
 def destroy
  in_cart_product = InCartProduct.find(params[:id])
  in_cart_product.destroy
  redirect_to in_cart_products_path
 end
 
 def all_destroy
  in_cart_products = InCartProduct.all
  in_cart_products.destroy_all
  redirect_to in_cart_products_path
 end
 

  
private
  def in_cart_product_params
    params.require(:in_cart_product).permit(:product_id, :quantity)
  end
  
  def update_in_cart_product_params
     params.require(:in_cart_product).permit(:quantity)
  end
   
  
end
