class CreatePatientDemographics < ActiveRecord::Migration
  def change
    create_table :patient_demographics do |t|
      t.belongs_to :patient_record
      t.string :site_location,              :null => false, :default => ""
      t.boolean :parental_permission,       :null => false, :default => false
      t.text :allergies
      t.text :reaction_type
      t.boolean :utd,                       :null => false, :default => false
      t.boolean :dtap,                      :null => false, :default => false
      t.boolean :hib,                       :null => false, :default => false
      t.boolean :pneumovax,                 :null => false, :default => false
      t.boolean :hepA,                       :null => false, :default => false
      t.boolean :hepB,                       :null => false, :default => false
      t.boolean :influenza,                       :null => false, :default => false
      t.boolean :mmr,                       :null => false, :default => false
      t.text :additional_immunizations
      t.text :relevant_info
      t.timestamps
    end
  end
end
