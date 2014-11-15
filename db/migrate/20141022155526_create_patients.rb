class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name,           :null => false, :default => ""
      t.string :last_name,            :null => false, :default => ""
      t.string :middle_name
      t.string :gender,               :null => false
      t.date :dob,                    :null => false
      t.string :parent_permission
      t.string :parent_permission_desc
      t.integer :created_by,          :null => false
      t.timestamps
    end
  end
end