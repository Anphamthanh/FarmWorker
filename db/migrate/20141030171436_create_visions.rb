class CreateVisions < ActiveRecord::Migration
  def change
    create_table :visions do |t|
      t.references :patient,         index: true
      t.boolean :unable_to_screen,                    default: false
      t.boolean :use_corrective_lenses,               default: false
      t.boolean :need_further_evaluation,             default: false
      t.boolean :under_professional_care,             default: false
      t.boolean :worn_for_testing,                    default: false
      t.boolean :color_blindness,                     default: false
      t.boolean :corrective_lenses,                   default: false
      t.integer :ol1
      t.integer :ol2  
      t.boolean :ol_result
      t.integer :od1
      t.integer :od2
      t.boolean :od_result
      t.integer :ou1
      t.integer :ou2
      t.boolean :ou_result
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
