class PatientController < ApplicationController

  before_action :authenticate_practitioner

  # Jackson's branch
  def index
    @patients = Patient.all
  end
  ###

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
    @patient = Patient.find_by_id(params[:id])
  end

  def view
    @patient = Patient.find_by_id(params[:id])
    if @patient.nil?
      flash[:alert] = "Patient does not exist!" 
      redirect_to dashboard
    else 
      record = @patient.patient_record
      @demographics = record.patient_demographics
      @vitals = record.patient_vital
      @hearing = record.patient_hearing
      @vision = record.patient_vision
      @physical = record.patient_physical
      @assessment = record.patient_assessment
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :gender)
  end

  def dashboard
    if current_user.role.downcase == "student-bsn"
      student_dashboard_path
    elsif current_user.role.downcase == "faculty"
      faculty_dashboard_path
    else
      root_path
    end
  end

  def authenticate_practitioner    
    authenticate_user!
    if !['faculty', 'student-bsn', 'student-msn'].include?(current_user.role.downcase)
      flash[:alert] = "Access denied! This page is for practitioners only."
      redirect_to root_path
    end
  end
end
>>>>>>> master
