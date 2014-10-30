class PatientRecord < ActiveRecord::Base
  belongs_to :patient
  has_one :patient_demographics
  validates :patient_id, presence: true
end
