class StudentController < ApplicationController
  before_action :authenticate_student

  def dashboard
    @all_patients = Patient.all
  end

  def new_patient
    patient = Patient.new(patient_params)
    patient.created_by = current_user.id
    patient.patient_log = "Created by #{current_user.first_name} 
          #{current_user.last_name} at #{Time.now}"
    if patient.save
      flash[:notice] = "The patient #{patient.first_name} #{patient.last_name} 
          was successfully created"
    else
      flash[:alert] = "Failed to create patient: " + patient.errors.full_messages.join('. ')
    end
    redirect_to :student_dashboard
  end

  private

  def authenticate_student
    authenticate_user!
    if current_user.role.downcase == 'admin' 
      flash[:alert] = "Access denied! This page is for practitioners only."
      redirect_to root_path
    end
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :gender)
  end
end
