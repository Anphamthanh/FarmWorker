class CreateVitals < ActiveRecord::Migration
  def change
    create_table :vitals do |t|      
      t.references :patient,         index: true
      t.integer :height,                    :default => 0
      t.integer :weight,                    :default => 0
      t.float :bmi,                    :default => 0
      t.string :blood_pressure,                    :default => 0
      t.float :hemoglobin,                    :default => 0
      t.float :blood_glucose,                    :default => 0
      t.string :practitioner,               :null => false, :default => ""
      t.timestamps
    end
  end
end
