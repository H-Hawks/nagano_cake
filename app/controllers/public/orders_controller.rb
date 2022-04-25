class Public::OrdersController < ApplicationController

  before_action :authenticate_end_user!


  def new
    @order = Order.new
    @user = current_end_user
  end

  def index
    @orders = current_end_user.orders.all
  end

  def comfirm
    @in_cart_products = current_end_user.in_cart_products
    @order = Order.new(order_params)
    @order.shipping_fee = 800
    @order.end_user_id = current_end_user.id
    if params[:order][:select_address] == '0'
      @order.payment_method = params[:order][:payment_method]
      @order.postcode = current_end_user.postcode
      @order.address = current_end_user.address
      @order.name = current_end_user.last_name + current_end_user.first_name
    elsif params[:order][:select_address] == '1'
      @address = Address.find(params[:order][:address_id])
      @order.payment_method = params[:order][:payment_method]
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == '2'
      @address = Address.find(params[:order][:postcode, :address, :name])
      @order.payment_method = params[:order][:payment_method]
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    end
    @in_cart_products.each do |in_cart_product|
      @total = 0
      @total += in_cart_product.subtotal
    end
  end

  def create
    order_params[:order_status] = order_params[:order_status].to_i
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @order.save
    @in_cart_products = current_end_user.in_cart_products
    @in_cart_products.each do |in_cart_product|
      @order_detail = OrderDetail.new
      @order_detail.product_id = in_cart_product.product_id
      @order_detail.order_id = @order.id
      @order_detail.tax_price = in_cart_product.product.add_tax_price
      @order_detail.quantity = in_cart_product.quantity
      @order_detail.production_status = 0
      @order_detail.save
    end
    @in_cart_products.destroy_all
    redirect_to order_thanks_path
  end

  def thanks
  end


  def show
    @order = Order.find(params[:id])
    @in_cart_products = InCartProduct.all
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address_id,
    :postcode, :address, :name, :bill, :order_status, :shipping_fee)
  end
end
