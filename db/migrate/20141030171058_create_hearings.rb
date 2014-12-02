class CreateHearings < ActiveRecord::Migration
  def change
    create_table :hearings do |t|
      t.references :patient,         index: true
      t.boolean :unable_to_screen,                    default: false
      t.boolean :use_assitive_device,                 default: false
      t.boolean :f500
      t.boolean :f1k
      t.boolean :f2k
      t.boolean :f4k
      t.integer :audiometer
      t.integer :al
      t.integer :ad
      t.boolean :need_further_evaluation,             default: false
      t.text :comment
      t.timestamps
    end
  end
end
