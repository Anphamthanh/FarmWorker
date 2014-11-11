class Patient < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, 
                        :dob, :gender
  has_one :patient_record
  def self.search(search)
    if search
      where(['first_name LIKE :s OR last_name LIKE :s OR id LIKE :s', :s => "%#{search}"]).order('last_name ASC')
    else
      Patient.all.order('last_name ASC')
    end
  end
end
