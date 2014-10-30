class CreatePatientRecords < ActiveRecord::Migration
  def change
    create_table :patient_records do |t|
      t.belongs_to :patient
      t.timestamps
    end
  end
end
