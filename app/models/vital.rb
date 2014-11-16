class Vital < ActiveRecord::Base
  belongs_to :patient

  before_validation :build_height
  attr_accessor :in_feet, :in_inches

  def build_height
    in_feet = self.in_feet.gsub(/[^0-9 ]/i, '')
    in_inches= self.in_inches.gsub(/[^0-9 ]/i, '')
    self.height = in_feet.to_i * 12 + in_inches.to_i
  end

  def height_in_feet
    height/12
  end

  def height_in_inches
    height%12
  end

end
