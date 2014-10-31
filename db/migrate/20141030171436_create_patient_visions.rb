class CreatePatientVisions < ActiveRecord::Migration
  def change
    create_table :patient_visions do |t|
      t.references :patient_record,         index: true
      t.integer :ol
      t.integer :od
      t.integer :ou
      t.boolean :color_blindness,           :default => false
      t.boolean :corrective_lenses,         :default => false
      t.text :comment
      t.timestamps
    end
  end
end
