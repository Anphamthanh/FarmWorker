class PatientController < ApplicationController
  def new
    patient = Patient.new(patient_params)
    patient.created_by = current_user.id
    patient.patient_log = "Created by #{current_user.first_name} #{current_user.last_name} at #{Time.now}"
    if patient.save
      flash[:notice] = "The patient #{patient.first_name} #{patient.last_name} was successfully created"
      redirect_to :controller => "patient", :action => "demographics", :id => patient.id
    else
      flash[:alert] = "Failed to create patient: " + patient.errors.full_messages.join('. ')
      redirect_to student_dashboard
    end
  end

  def demographics
    @patient = Patient.find(params[:id])
  end

  def view
    @patient = Patient.find(params[:id])
    record = @patient.patient_record
    @demographics = record.patient_demographics
    @vitals = record.patient_vital
    @hearing = record.patient_hearing
    @vision = record.patient_vision
    @physical = record.patient_physical
    @assessment = record.patient_assessment
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :gender)
  end
end
