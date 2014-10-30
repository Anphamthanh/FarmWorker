class CreatePatientAssessments < ActiveRecord::Migration
  def change
    create_table :patient_assessments do |t|
      t.references :patient_record,         index: true
      t.text :general_assessment
      t.timestamps
    end
  end
end
