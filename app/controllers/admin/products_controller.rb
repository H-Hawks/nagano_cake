class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
  end
  
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product.id)
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end
  
  private
  def product_params
    params.require(:product).permit(:name,:image,:description,:non_taxed_price,:genre_id)
  end
  
end
