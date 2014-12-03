class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.references :patient,         index: true
      t.text :general_assessment
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
