class AdminController < ApplicationController

  before_action :authenticate_user!

  def dashboard
  end

  def register
    @user = User.new(admin_params)
    if @user.save
      flash[:notice] = "The user #{@user.username} was successfully created"
    else
      flash[:alert] = "Failed to create user: " + @user.errors.full_messages.join('. ')
    end
    redirect_to :admin_dashboard
  end

  private

  def admin_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
  end
end
