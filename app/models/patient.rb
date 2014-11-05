class Patient < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, 
                        :dob, :gender
  has_one :patient_record
  def self.search(search)
    if search
      where ['first_name LIKE :s OR last_name LIKE :s', :s => "%#{search}"]
    else
      Patient.all
    end
  end
end
