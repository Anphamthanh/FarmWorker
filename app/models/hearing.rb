class Hearing < ActiveRecord::Base
  belongs_to :patient
  validates_presence_of :comment, if: :unable_to_screen
end
