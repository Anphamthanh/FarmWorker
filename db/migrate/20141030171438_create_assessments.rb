class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.references :patient,         index: true
      t.text :general_assessment
      t.timestamps
    end
  end
end