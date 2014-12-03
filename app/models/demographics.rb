class Demographics < ActiveRecord::Base

  belongs_to :patient

  def is_validated?
    !validator.nil? 
  end

  def can_I_validate?(role)
    if practitioner.empty?
      false
    else
      if role.downcase == "faculty" or (role.downcase == "student-msn" and practitioner_role.downcase == "student-bsn")
        true
      else
        false
      end
    end
  end
  
end
