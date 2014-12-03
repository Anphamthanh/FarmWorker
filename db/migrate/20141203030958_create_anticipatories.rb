class CreateAnticipatories < ActiveRecord::Migration
  def change
    create_table :anticipatories do |t|
      t.references :patient,         index: true
      t.string :health_promotion1
      t.string :health_promotion2
      t.string :development_stimulation1
      t.string :development_stimulation2
      t.string :socialization1
      t.string :socialization2
      t.string :nutrition1
      t.string :nutrition2
      t.text :comment
      t.string :practitioner,                         :null => false, default: ""
      t.string :practitioner_role,               :null => false, :default => ""
      t.string :validator,                  :null => false, :default => ""
      t.string :validator_role,             :null => false, :default => ""
      t.datetime :validated_at
      t.timestamps
    end
  end
end
