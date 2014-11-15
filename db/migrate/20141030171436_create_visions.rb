class CreateVisions < ActiveRecord::Migration
  def change
    create_table :visions do |t|
      t.references :patient,         index: true
      t.integer :ol
      t.integer :od
      t.integer :ou
      t.boolean :color_blindness,           :default => false
      t.boolean :corrective_lenses,         :default => false
      t.text :comment
      t.timestamps
    end
  end
end
