class PatientDemographics < ActiveRecord::Base
  belongs_to :patient_record
end
