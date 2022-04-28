class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
      if @order.update(order_params)
        #結果(変更)　if 条件
        #@order.order_details.update_all(production_status: 1) if @order.order_status == "payment_confirmation"
        if @order.order_status == "payment_confirmation"
            @order.order_details.each do |order_detail|
            order_detail.production_status = "waiting_for_production"
            order_detail.save
            end
        end
        redirect_to request.referer
      end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postcode,:address,:name,:quantity,:shipping_fee,:bill,:payment_method,:order_status)
  end
  
  def order_detail_params
    params.require(:o).permit(:production_status)
  end
  
  
end
