class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.role.downcase == "admin"
      admin_dashboard_path
    elsif resource.role.downcase == "faculty"
      faculty_dashboard_path
    elsif ["student-bsn","student-msn"].include? resource.role.downcase
      student_dashboard_path
    else
      root_path
    end
  end

end
