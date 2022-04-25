class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @user = current_end_user
  end

  def comfirm
    @in_cart_products = InCartProduct.all
    @order = Order.new(order_params)
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
    @order = Order.new(order_params)
    @order.save
    redirect_to order_thanks_path
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address_id, :postcode, :address, :name, :bill, :order_status)
  end
end
