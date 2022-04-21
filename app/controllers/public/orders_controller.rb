class Public::OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    
    @user = current_user.id
    @address = Order.address.new
    if @address.save
      redirect_to order_path
    end
  end

  def show
  end

  private
  def address_params
    params.permit
  end
end
