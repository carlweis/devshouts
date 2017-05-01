class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id], role: "user")
    unless @user
      flash[:error] = "User does not exist"
      redirect_to root_path
    end
  end
end
