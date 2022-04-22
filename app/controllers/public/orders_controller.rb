class Public::OrdersController < ApplicationController
  def new
    @user = current_end_user
    @address = Address.new
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
