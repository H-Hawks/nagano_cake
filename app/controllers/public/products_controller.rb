class Public::ProductsController < ApplicationController
 def index
@total_products = Product.all
@products = Product.page(params[:page])
 end

def show
@product = Product.find(params[:id])
@in_cart_product = InCartProduct.new
 end
 

end
