class PatientRecord < ActiveRecord::Base
  belongs_to :patient
  has_one :patient_demographics, :patient_vital, :patient_hearing, 
          :patient_vision, :patient_physical, :patient_assessment
  validates :patient_id, presence: true
end
