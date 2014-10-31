class CreatePatientVitals < ActiveRecord::Migration
  def change
    create_table :patient_vitals do |t|      
      t.references :patient_record,         index: true
      t.integer :height,                    :null => false
      t.float :weight,                      :null => false
      t.float :bmi,                         :null => false
      t.string :blood_pressure,             :null => false
      t.float :hemoglobin
      t.float :blood_glucose
      t.timestamps
    end
  end
end
