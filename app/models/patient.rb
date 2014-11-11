class Patient < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, 
                        :dob, :gender
  validates_presence_of :parent_permission, if: :is_under_18?
  validates_presence_of :parent_permission_desc, if: [:is_limited?, :is_under_18?]
  has_one :patient_record

  def self.search(search)
    if search
      where(['first_name LIKE :s OR last_name LIKE :s OR id LIKE :s', :s => "%#{search}"]).order('last_name ASC')
    else
      Patient.all.order('last_name ASC')
    end
  end

  def is_under_18?
    (Date.today - dob).to_i / 365 < 18
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
