class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.references :patient,         index: true
      t.string :site_location,              :null => false, :default => ""
      t.text :allergies
      t.text :reaction_type
      t.integer :dtap
      t.integer :tdap
      t.integer :hib
      t.integer :pneumovax
      t.integer :hepa
      t.integer :hepb
      t.integer :influenza
      t.integer :men
      t.integer :mmr
      t.text :additional_immunizations
      t.text :additional_notes
      t.string :practitioner,               :null => false, :default => ""
      t.timestamps
    end
  end
end
