class AdminController < ApplicationController

  before_action :authenticate_user!

  def dashboard
  end

  def register
    @user = User.create(admin_params)
    flash[:notice] = "The user #{@user.username} was successfully created"
    redirect_to :admin_dashboard
  end

  private

  def admin_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
  end
end
