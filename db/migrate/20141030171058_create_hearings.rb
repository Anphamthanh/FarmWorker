class CreateHearings < ActiveRecord::Migration
  def change
    create_table :hearings do |t|
      t.references :patient,         index: true
      t.integer :al
      t.integer :ad
      t.text :comment
      t.timestamps
    end
  end
end
