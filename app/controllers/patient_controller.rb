class PatientController < ApplicationController

  before_action :authenticate_practitioner

  def new
    patient = Patient.new(patient_params)
    patient.created_by = current_user.id
    if patient.save
      flash[:notice] = "The patient #{patient.first_name} #{patient.last_name} was successfully created"
      redirect_to :controller => "patient", :action => "input", :id => patient.id, :type => "demographics"
    else
      flash[:alert] = "Failed to create patient: " + patient.errors.full_messages.join('. ')
      redirect_to dashboard
    end
  end

  def input
    patient = Patient.find(params[:id])
    if patient.parent_permission.downcase == "none"
      flash[:alert] = "Error! Can't edit patient information without parent permission"
      redirect_to dashboard
    end
    @patient = Patient.find_by_id(params[:id])
    @type = params[:type]
  end

  def update
    @patient = Patient.find_by_id(params[:id])
    type = params[:type]
    @patient.create_patient_record if @patient.patient_record.nil?
    if type == "demographics"
      @patient.patient_record.create_patient_demographics if @patient.patient_record.patient_demographics.nil?
      @patient.patient_record.patient_demographics.update_attributes(demographics_params)
      @patient.save
    end
    redirect_to_next_tab(type) 
  end

  def view
    @patient = Patient.find_by_id(params[:id])
    if @patient.nil?
      flash[:alert] = "Patient does not exist!" 
      redirect_to dashboard
    else 
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "demographics"
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :middle_name, :dob, :gender, :parent_permission, :parent_permission_desc)
  end

  def demographics_params
    params.require(:patient_record).permit(:site_location, :allergies, :reaction_type, 
      :dtap, :hib, :pneumovax, :hepa, :hepb, :influenza, :men, :mmr, 
      :additional_immunizations, :additional_notes, :practitioner)
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

  def redirect_to_next_tab(type)
    if type == "demographics"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "vitals"
    elsif type == "vitals"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "physical"
    elsif type == "physical"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "hearing"
    elsif type == "hearing"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "vision"
    elsif type == "vision"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "assessment"
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
