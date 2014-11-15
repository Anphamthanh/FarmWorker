class CreatePhysicals < ActiveRecord::Migration
  def change
    create_table :physicals do |t|
      t.references :patient,         index: true
      t.string :general_appearance
      t.string :head_hair
      t.string :skin
      t.string :eyes
      t.string :ears
      t.string :nose
      t.string :mouth
      t.string :throat
      t.string :thyroid
      t.string :lymph_pre_auricular 
      t.string :lymph_post_auricular 
      t.string :lymph_anterior_cervical
      t.string :lymph_anterior_cervical
      t.string :lymph_occipital
      t.string :lymph_axillary
      t.string :vascular
      t.string :heart
      t.string :lungs
      t.string :abdomen
      t.string :musculoskeletal
      t.string :scoliosis_screening
      t.string :neuro
      t.timestamps
    end
  end
end
