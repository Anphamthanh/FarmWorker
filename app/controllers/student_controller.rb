class StudentController < ApplicationController
  before_action :authenticate_student

  def dashboard
  end

  private

  def authenticate_student
    if current_user.role.downcase == 'admin' 
      flash[:alert] = "Access denied! This page is for practitioners only."
      redirect_to root_path
    end
  end
end
