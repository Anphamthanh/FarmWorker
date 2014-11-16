class Vital < ActiveRecord::Base

  belongs_to :patient

  attr_accessor :in_feet, :in_inches

  def height_in_feet
    height/12
  end

  def height_in_inches
    height%12
  end

end
