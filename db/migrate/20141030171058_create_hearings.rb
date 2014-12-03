class CreateHearings < ActiveRecord::Migration
  def change
    create_table :hearings do |t|
      t.references :patient,         index: true
      t.boolean :unable_to_screen,                    default: false
      t.boolean :use_assitive_device,                 default: false
      t.boolean :alf500
      t.boolean :alf750
      t.boolean :alf1k
      t.boolean :alf2k
      t.boolean :alf4k
      t.boolean :adf500
      t.boolean :adf750
      t.boolean :adf1k
      t.boolean :adf2k
      t.boolean :adf4k
      t.integer :audiometer
      t.integer :al
      t.integer :ad
      t.boolean :need_further_evaluation,             default: false
      t.boolean :under_professional_care,             default: false
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
