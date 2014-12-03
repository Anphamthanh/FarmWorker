class FacultyController < ApplicationController

  before_action :authenticate_faculty

  def dashboard
    @all_patients = Patient.search(params[:search]).page(params[:page]).per_page(5)
  end

  private

  def authenticate_faculty
    authenticate_user!
    if current_user.role.downcase != 'faculty'
      flash[:alert] = "Access denied! This page is for faculty practitioners only."
      redirect_to root_path
    end
  end
end
