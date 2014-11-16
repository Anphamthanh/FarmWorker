class Vital < ActiveRecord::Base

  belongs_to :patient

  attr_accessor :in_feet, :in_inches, :sys, :dia

  def height_in_feet
    height/12
  end

  def height_in_inches
    height%12
  end

  def sys
    blood = blood_pressure.split('/')
    blood[0]
  end

  def dia
    blood = blood_pressure.split('/')
    blood[1]
  end

end
