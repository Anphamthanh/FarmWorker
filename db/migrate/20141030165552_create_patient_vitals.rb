class CreatePatientVitals < ActiveRecord::Migration
  def change
    create_table :patient_vitals do |t|      
      t.references :patient,         index: true
      t.integer :height
      t.float :weight
      t.float :bmi
      t.string :blood_pressure
      t.float :hemoglobin
      t.float :blood_glucose
      t.timestamps
    end
  end
end
