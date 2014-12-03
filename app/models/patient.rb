class Patient < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, 
                        :dob, :gender
  validates_presence_of :parent_permission, if: :is_child?
  validates_presence_of :parent_permission_desc, if: [:is_limited?, :is_child?]

  has_one :demographics,              dependent: :destroy
  has_one :vital,              dependent: :destroy
  has_one :hearing,              dependent: :destroy
  has_one :vision,              dependent: :destroy
  has_one :physical,              dependent: :destroy
  has_one :assessment,              dependent: :destroy
  has_one :anticipatory,              dependent: :destroy

  before_create :init

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
    (Date.today - dob).to_i < 365 * 18
  end

  def is_adult?
    !is_child?
  end

  def is_under_1?
    (Date.today - dob).to_i < 365
  end

  def is_under_2?
    (Date.today - dob).to_i < 365 * 2
  end

  def is_under_3?
    (Date.today - dob).to_i < 365 * 3
  end

  def is_under_4?
    (Date.today - dob).to_i < 365 * 4
  end

  def is_under_5?
    (Date.today - dob).to_i < 365 * 5
  end

  def is_under_6?
    (Date.today - dob).to_i < 365 * 6
  end

  def is_under_7?
    (Date.today - dob).to_i < 365 * 7
  end

  def is_under_10?
    (Date.today - dob).to_i < 365 * 10
  end

  def is_under_21?
    (Date.today - dob).to_i < 365 * 21
  end

  def month_age
    (Date.today - dob).to_i / 30
  end

  def is_limited?
    parent_permission.downcase == "limited"
  end

  def is_under_1_month?
    (Date.today - dob).to_i < 30    
  end
  
  def is_under_2_month?
    (Date.today - dob).to_i < 30 * 2   
  end
  
  def is_under_4_month?
    (Date.today - dob).to_i < 30 * 4   
  end
  
  def is_under_5_month?
    (Date.today - dob).to_i < 30 * 5  
  end

  def is_under_6_month?
    (Date.today - dob).to_i < 30 * 6  
  end

  def is_under_9_month?
    (Date.today - dob).to_i < 30 * 9  
  end

  def is_under_15_month?
    (Date.today - dob).to_i < 30 * 15  
  end

  def is_under_18_month?
    (Date.today - dob).to_i < 30 * 18  
  end

  def is_under_19_month?
    (Date.today - dob).to_i < 30 * 19  
  end

  def is_under_51_month?
    (Date.today - dob).to_i < 30 * 51  
  end

  def get_hepb_count
    if is_under_1_month?
      1
    elsif !is_under_1_month? and is_under_6_month?
      2
    elsif !is_under_6_month?
      3
    else
      0
    end
  end

  def get_dtap_count
    if !is_under_2_month? and is_under_4_month?
      1
    elsif !is_under_4_month? and is_under_6_month?
      2
    elsif !is_under_6_month? and is_under_15_month?
      3
    elsif !is_under_15_month? and is_under_4?
      4
    elsif !is_under_4? and is_under_7?
      5
    else
      0
    end    
  end

  def get_tdap_count
    if !is_under_7?
      1
    else
      0
    end
  end

  def get_hib_count
    if !is_under_2_month? and is_under_4_month?
      1
    elsif !is_under_4_month? and is_under_6_month?
      2
    elsif !is_under_6_month? and is_under_4?
      4
    else
      0
    end
  end

  def get_hepa_count
    if !is_under_1?
      2
    else
      0
    end
  end

  def get_mmr_count
    if !is_under_1? and is_under_4?
      1
    elsif !is_under_4?
      2
    else
      0
    end
  end

  def get_men_count
    if !is_under_2_month?
      1
    else
      0
    end
  end

  def get_influenza_count
    if !is_under_6_month?
      1
    else
      0
    end
  end

  def get_pneumovax_count
    if is_under_51_month?
      4
    else
      5
    end
  end

  def is_editable?
    if is_adult?
      true
    else
      if parent_permission.downcase == "complete" or (parent_permission.downcase == "limited" and !parent_permission_desc.empty?)
        true
      else
        false
      end
    end
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

  def is_validated?(type_name)
    !self.send(type_name).validator.nil? 
  end

  def can_I_validate?(type_name, role)
    type = self.send(type_name)
    if type.practitioner.empty?
      false
    else
      if role.downcase == "faculty" or (role.downcase == "student-msn" and type.practitioner_role.downcase == "student-bsn")
        true
      else
        false
      end
    end
  end

  def init
    create_demographics
    create_assessment
    create_hearing
    create_physical
    create_vision
    create_vital
    create_anticipatory
  end

end
