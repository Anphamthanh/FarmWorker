class PatientController < ApplicationController
  def index
    @patients = Patient.all
  end
end