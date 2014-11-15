class Demographics < ActiveRecord::Base
  belongs_to :patient
  validates_presence_of :practitioner
end
