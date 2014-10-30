class StudentController < ApplicationController
  before_action :authenticate_student

  def dashboard
    @all_patients = Patient.all
  end

  private

  def authenticate_student
    authenticate_user!
    if current_user.role.downcase == 'admin' 
      flash[:alert] = "Access denied! This page is for practitioners only."
      redirect_to root_path
    end
  end
end
