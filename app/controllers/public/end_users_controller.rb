class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end
  
  private

  def end_user_params
    params.require(:end_user).permit(:)
  end
  
end
