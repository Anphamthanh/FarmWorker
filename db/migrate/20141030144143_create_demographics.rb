class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.references :patient,         index: true
      t.string :site_location,              :null => false, :default => ""
      t.text :allergies
      t.text :reaction_type
      t.integer :dtap,                                       :default => "0"
      t.integer :tdap,                                       :default => "0"
      t.integer :hib,                                       :default => "0"
      t.integer :pneumovax,                                 :default => "0"
      t.integer :hepa,                                      :default => "0"
      t.integer :hepb,                                       :default => "0"
      t.integer :influenza,                                 :default => "0"
      t.integer :men,                                       :default => "0"
      t.integer :mmr,                                       :default => "0"
      t.text :additional_immunizations
      t.text :additional_notes
      t.string :practitioner,               :null => false, :default => ""
      t.timestamps
    end
  end
end
