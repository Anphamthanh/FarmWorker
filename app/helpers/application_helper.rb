module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def dashboard
    if current_user
      if current_user.role.downcase == "admin"
        admin_dashboard_path
      elsif ["student-bsn", "student-msn"].include? current_user.role.downcase
        student_dashboard_path
      elsif current_user.role.downcase == "faculty"
        faculty_dashboard_path
      end
    else
      root_path
    end
  end

  def is_faculty?
    if current_user
      current_user.role.downcase == "faculty"
    else
      false
    end
  end

  def is_admin?
    if current_user
      current_user.role.downcase == "admin"
    else
      false
    end
  end

  def is_student?
    if current_user
      ["student-bsn", "student-msn"].include? current_user.role.downcase
    else
      false
    end
  end

end
