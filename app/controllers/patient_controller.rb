class PatientController < ApplicationController
  def new
    @patient = Patient.new(patient_params)
    @patient.created_by = current_user.id
    @patient.patient_log = "Created by #{current_user.first_name} #{current_user.last_name} at #{Time.now}"
    if @patient.save
      flash[:notice] = "The patient #{@patient.first_name} #{@patient.last_name} was successfully created"
    else
      flash[:alert] = "Failed to create patient: " + patient.errors.full_messages.join('. ')
    end
    redirect_to :student_dashboard
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :gender)
  end
end