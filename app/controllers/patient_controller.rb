class PatientController < ApplicationController

  require 'active_support/core_ext/integer/inflections'

  before_action :authenticate_practitioner

  def create
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

  def update
    patient = Patient.find(params[:id])
    patient.update_attributes(patient_params)
    flash[:notice] = "The patient #{patient.first_name} #{patient.last_name} was successfully updated"
    redirect_to :controller => "patient", :action => "input", :id => patient.id, :type => "demographics"
  end

  def input
    @patient = Patient.find_by_id(params[:id])
    if !@patient.is_editable?
      flash[:notice] = "Restriction: Can't enter patient information without parent permission."
    end
    @type = params[:type]
  end

  def update_record
    @patient = Patient.find_by_id(params[:id])
    type = params[:type]
    if type == "demographics"
      @patient.demographics.update_attributes(demographics_params)
    elsif type == "vital"
      attrs = vitals_params
      feet = attrs[:in_feet].gsub(/[^0-9 ]/i, '').to_i
      inches = attrs[:in_inches].gsub(/[^0-9 ]/i, '').to_i
      attrs[:height] = feet * 12 + inches
      attrs[:bmi] = (attrs[:weight].gsub(/[^0-9 ]/i, '').to_f*703.0/(attrs[:height].to_f**2)).round(1)
      attrs[:blood_pressure] = [attrs[:sys], attrs[:dia]].join('/')
      puts attrs 
      @patient.vital.update_attributes(attrs)
    elsif type == "physical"
      if !@patient.physical.update_attributes(physical_params)
        flash[:alert] = "Failed to update physical: " + @patient.physical.errors.full_messages.join('. ')
        type = "vital"
      end
    elsif type == "hearing"
      if !@patient.hearing.update_attributes(hearing_params)
        flash[:alert] = "Failed to update hearing: " + @patient.hearing.errors.full_messages.join('. ')
        type = "physical"
      end
    elsif type == "vision"
      if !@patient.vision.update_attributes(vision_params)
        flash[:alert] = "Failed to update vision: " + @patient.vision.errors.full_messages.join('. ')
        type = "hearing"
      end
    elsif type == "anticipatory"
      if !@patient.anticipatory.update_attributes(anticipatory_params)
        flash[:alert] = "Failed to update anticipatory: " + @patient.anticipatory.errors.full_messages.join('. ')
        type = "vision"
      end
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
    params.require(:patient).permit(:first_name, :last_name, :middle_name, :dob, 
      :gender, :parent_permission, :parent_permission_desc)
  end

  def demographics_params
    params.require(:patient_record).permit(:site_location, :allergies, :reaction_type, 
      :dtap, :hib, :pneumovax, :hepa, :hepb, :influenza, :men, :mmr, 
      :additional_immunizations, :additional_notes, :practitioner,
      :practitioner_role, :validator, :validator_role, :validated_at)
  end

  def vitals_params
    params.require(:patient_record).permit(:in_feet, :in_inches, :blood_glucose,
      :weight, :bmi, :sys, :dia, :hemoglobin, :practitioner)
  end

  def physical_params
    params.require(:patient_record).permit(:unable_to_screen, :general_appearance, 
        :head_hair, :skin, :eyes, :ears, :nose, :mouth, :throat, :thyroid,
        :lymph_pre_auricular, :lymph_post_auricular, :lymph_anterior_cervical,
        :lymph_anterior_cervical, :lymph_occipital, :lymph_axillary, :vascular,
        :heart, :lungs, :abdomen, :musculoskeletal, :scoliosis_screening, :neuro,
        :additional_notes, :comment, :practitioner)
  end

  def hearing_params
    params.require(:patient_record).permit(:unable_to_screen, :use_assitive_device,
      :alf500, :alf750, :alf1k, :alf2k, :alf4k, :adf500, :adf750, :adf1k, :adf2k, :adf4k,
      :under_professional_care, :need_further_evaluation, :comment, :practitioner)
  end

  def vision_params
    params.require(:patient_record).permit(:unable_to_screen, :use_corrective_lenses,
      :worn_for_testing,
      :under_professional_care, :need_further_evaluation, :comment, :practitioner)
  end

  def anticipatory_params
    params.require(:patient_record).permit(:comment, :practitioner,
      :development_stimulation1, :development_stimulation2,
      :socialization1, :socialization2, :nutrition1, :nutrition2,
      :health_promotion2, :health_promotion1)
  end

  def redirect_to_next_tab(type)
    if type == "demographics"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "vital"
    elsif type == "vital"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "physical"
    elsif type == "physical"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "hearing"
    elsif type == "hearing"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "vision"
    elsif type == "vision"
      redirect_to :controller => "patient", :action => "input", :id => @patient.id, :type => "anticipatory"
    elsif type == "anticipatory"
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
