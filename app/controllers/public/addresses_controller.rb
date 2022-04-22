class Public::AddressesController < ApplicationController
before_action :authenticate_end_user!
  
  def index
    @address = Address.new
    @addresses = current_end_user.addresses
  end
  
  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    redirect_to '/addresses'
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path(@address.id)
    else
      render "edit"
    end
  end
  
  def destroy
     @address = Address.find(params[:id])
     @address.destroy
     @address = current_end_user.address
     redirect_to addresses_path
  end
    
  private
  
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end

end
