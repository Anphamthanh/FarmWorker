class CreatePatientRecords < ActiveRecord::Migration
  def change
    create_table :patient_records do |t|
      t.references :patient, index: true
      t.timestamps
    end
  end
end
