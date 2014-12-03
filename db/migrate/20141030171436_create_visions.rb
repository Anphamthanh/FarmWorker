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
      t.integer :ol
      t.integer :od
      t.integer :ou
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
