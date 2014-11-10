class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name,           :null => false, :default => ""
      t.string :last_name,            :null => false, :default => ""
      t.string :gender,               :null => false
      t.date :dob,                    :null => false
      # parent_permission is saved in the form ["None", ""] or ["Complete", ""] or ["Limited", "<Explanation>"]
      t.text :parent_permission,    :null => false
      t.integer :created_by,          :null => false
      t.timestamps
    end
  end
end