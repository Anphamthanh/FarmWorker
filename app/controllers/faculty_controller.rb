class FacultyController < ApplicationController

  before_action :authenticate_faculty

  def dashboard
  end

  private

  def authenticate_faculty
    if current_user.role.downcase != 'faculty'
      flash[:alert] = "Access denied! This page is for faculty practitioners only."
      redirect_to root_path
    end
  end
end
