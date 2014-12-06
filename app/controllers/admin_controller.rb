class AdminController < ApplicationController

  before_action :authenticate_admin

  def dashboard
    @all_users = User.search(params[:search]).page(params[:page]).per_page(5)
  end

  def edit
    @all_users = User.search(params[:search]).page(params[:page]).per_page(5)
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find_by_id(params[:id])
    msg = "The user #{@user.username} was successfully deleted"
    if @user.destroy
      flash[:notice] = msg
    else       
      flash[:alert] = "Failed to delete user: " + @user.errors.full_messages.join('. ')
    end
    redirect_to :admin_dashboard
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(update_params)
      flash[:notice] = "The user #{@user.username} was successfully updated"
    else       
      flash[:alert] = "Failed to update user: " + @user.errors.full_messages.join('. ')
    end
    redirect_to :admin_dashboard
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

  def update_params
    params.require(:user).permit(:username, :email, :role, :first_name, :last_name, :password)
  end

  def admin_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :role, :first_name, :last_name)
  end

  def authenticate_admin
    authenticate_user!
    if current_user.role.downcase != 'admin'
      flash[:alert] = "Access denied! Please log in as an administrator."
      redirect_to root_path
    end
  end
end
