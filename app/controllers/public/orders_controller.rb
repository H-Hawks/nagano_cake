class Public::OrdersController < ApplicationController
  
  before_action :authenticate_end_user!

  
  def new
    @user = current_end_user
    @address = Address.new
  end
  
  def index
    
  end

  def comfirm
  end

  def create
    @address.save
  end

  def show
  end

  private
  def address_params
    params.permit
  end
end
