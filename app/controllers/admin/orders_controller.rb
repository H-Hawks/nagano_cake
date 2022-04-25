class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all
  end

  def show
    # @orders = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:end_user_id,:postcode,:address,:name,:shipping_fee,:bill,:payment_method,:order_status)
  end
  
end
