class Public::EndUsersController < ApplicationController
  
  before_action :authenticate_end_user!
  
  def show
    @end_user = current_end_user
  end

  def edit
     @end_user = current_end_user
  end
  
  def update
     @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to end_user_my_page_path
    else
      render :edit
    end
  end
  
  def unsubcribe
    @end_user = current_end_user
  end
  
  def withdrawl
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :is_deleted)
  end
  
end
