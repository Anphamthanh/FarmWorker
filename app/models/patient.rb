class Patient < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, 
                        :dob, :gender
  validates_presence_of :parent_permission, if: :is_child?
  validates_presence_of :parent_permission_desc, if: [:is_limited?, :is_child?]

  has_one :patient_demographics,              dependent: :destroy
  has_one :patient_vital,              dependent: :destroy
  has_one :patient_hearing,              dependent: :destroy
  has_one :patient_vision,              dependent: :destroy
  has_one :patient_physical,              dependent: :destroy
  has_one :patient_assessment,              dependent: :destroy

  before_create :init
  
  def influenza
    patient_demographics.influenza
  end
  
  def pneumovax
    patient_demographics.pneumovax
  end
  
  def mmr
    patient_demographics.mmr
  end
  
  def hib
    patient_demographics.hib
  end
  
  def men
    patient_demographics.men
  end
  
  def hepb
    patient_demographics.hepb
  end
  
  def hepa
    patient_demographics.hepa
  end
  
  def dtap
    patient_demographics.dtap
  end
  
  def additional_immunizations
    patient_demographics.additional_immunizations
  end

  def additional_notes
    patient_demographics.additional_notes
  end

  def practitioner
    patient_demographics.practitioner
  end

  def site_location
    patient_demographics.site_location
  end

  def allergies
    patient_demographics.allergies
  end

  def reaction_type
    patient_demographics.reaction_type
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

  def is_child?
    (Date.today - dob).to_i / 365 < 18
  end

  def is_adult?
    !is_child?
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

  def init
    create_patient_demographics
    create_patient_assessment
    create_patient_hearing
    create_patient_physical
    create_patient_vision
    create_patient_vital
  end

end
