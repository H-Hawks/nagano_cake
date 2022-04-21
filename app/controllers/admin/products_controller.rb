class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end
  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end

  private
  def product_params
    params.require(:product).permit(:name,:image,:description,:non_taxed_price,:genre_id,:is_active)
  end
end
