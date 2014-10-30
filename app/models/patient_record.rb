class PatientRecord < ActiveRecord::Base
  belongs_to :patient
  has_one :patient_demographics
  has_one :patient_vital
  has_one :patient_hearing
  has_one :patient_vision
  has_one :patient_physical
  has_one :patient_assessment
  validates :patient_id, presence: true
end
