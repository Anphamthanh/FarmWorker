class CreatePatientDemographics < ActiveRecord::Migration
  def change
    create_table :patient_demographics do |t|
      t.references :patient_record,         index: true
      t.string :site_location,              :null => false, :default => ""
      t.text :allergies
      t.text :reaction_type
      t.boolean :dtap,                      :null => false, :default => false
      t.boolean :hib,                       :null => false, :default => false
      t.boolean :pneumovax,                 :null => false, :default => false
      t.boolean :hepa,                       :null => false, :default => false
      t.boolean :hepb,                       :null => false, :default => false
      t.boolean :influenza,                       :null => false, :default => false
      t.boolean :men,                       :null => false, :default => false
      t.boolean :mmr,                       :null => false, :default => false
      t.text :additional_immunizations
      t.text :additional_notes
      t.string :practitioner,               :null => false, :default => ""
      t.timestamps
    end
  end
end
