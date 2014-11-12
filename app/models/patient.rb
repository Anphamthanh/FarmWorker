class Patient < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, 
                        :dob, :gender
  validates_presence_of :parent_permission, if: :is_under_18?
  validates_presence_of :parent_permission_desc, if: [:is_limited?, :is_under_18?]
  has_one :patient_record
  
  def influenza
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return false
    end
    patient_record.patient_demographics.influenza
  end
  
  def pneumovax
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return false
    end
    patient_record.patient_demographics.pneumovax
  end
  
  def mmr
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return false
    end
    patient_record.patient_demographics.mmr
  end
  
  def hib
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return false
    end
    patient_record.patient_demographics.hib
  end
  
  def men
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return false
    end
    patient_record.patient_demographics.men
  end
  
  def hepb
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return false
    end
    patient_record.patient_demographics.hepb
  end
  
  def hepa
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return false
    end
    patient_record.patient_demographics.hepa
  end
  
  def dtap
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return false
    end
    patient_record.patient_demographics.dtap
  end
  
  def additional_immunizations
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return nil
    end
    patient_record.patient_demographics.additional_immunizations
  end

  def additional_notes
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return nil
    end
    patient_record.patient_demographics.additional_notes
  end

  def practitioner
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return ""
    end
    patient_record.patient_demographics.practitioner
  end

  def site_location
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return nil
    end
    patient_record.patient_demographics.site_location
  end

  def allergies
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return nil
    end
    patient_record.patient_demographics.allergies
  end

  def reaction_type
    if patient_record.nil? or patient_record.patient_demographics.nil?
      return nil
    end
    patient_record.patient_demographics.reaction_type
  end

  def self.search(search)
    if !(search =~ /\A[-+]?\d*\.?\d+\z/).nil?
      where(['id = :s', :s => "#{search}"])
    else
      if search
        where(['first_name LIKE :s OR last_name LIKE :s OR middle_name LIKE :s', :s => "%#{search}%"]).order('last_name ASC')
      else
        Patient.all.order('last_name ASC')
      end
    end
  end

  def is_under_18?
    (Date.today - dob).to_i / 365 < 18
  end

  def is_under_2?
    (Date.today - dob).to_i / 365 < 2
  end

  def month_age
    (Date.today - dob).to_i / 30
  end

  def is_limited?
    parent_permission.downcase == "limited"
  end

  def first_name=(s)
    write_attribute(:first_name, s.to_s.capitalize)
  end

  def last_name=(s)
    write_attribute(:last_name, s.to_s.capitalize)
  end

  def middle_name=(s)
    write_attribute(:middle_name, s.to_s.capitalize)
  end
end
