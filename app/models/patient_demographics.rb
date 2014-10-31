class PatientDemographics < ActiveRecord::Base
  belongs_to :patient_record
  validates :patient_record_id, presence: true

end
