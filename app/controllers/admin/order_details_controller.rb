class Admin::OrderDetailsController < ApplicationController
  
  before_action :authenticate_admin!
    
  def update
    @order = Order.find(params[:order_id])
    @order_detail = @order.order_details.find(params[:id])
    @order_details = @order.order_details
    if @order_detail.update(order_detail_params)
      if  @order_detail.production_status == "in_productions"
          @order.order_status = "production"
          @order.save
          redirect_to request.referer
      end
    elsif @order_details.each do |order_detail|
      if order_detail.production_status == "production_completed"
          @order.order_status = "ready_to_ship"
          @order.save!
          redirect_to request.referer
      end
      end
    end
  end
    
    
  private
    
  def order_detail_params
    params.require(:order_detail).permit(:name,:tax_price,:quantity,:production_status,:product_id,:order_id)
  end
  
  def order_params
    params.require(:order).permit(:order_status)
  end
    
end
