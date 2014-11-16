# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141030171438) do

  create_table "assessments", force: true do |t|
    t.integer  "patient_id"
    t.text     "general_assessment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assessments", ["patient_id"], name: "index_assessments_on_patient_id"

  create_table "demographics", force: true do |t|
    t.integer  "patient_id"
    t.string   "site_location",            default: ""
    t.text     "allergies"
    t.text     "reaction_type"
    t.integer  "dtap",                     default: 0
    t.integer  "tdap",                     default: 0
    t.integer  "hib",                      default: 0
    t.integer  "pneumovax",                default: 0
    t.integer  "hepa",                     default: 0
    t.integer  "hepb",                     default: 0
    t.integer  "influenza",                default: 0
    t.integer  "men",                      default: 0
    t.integer  "mmr",                      default: 0
    t.text     "additional_immunizations"
    t.text     "additional_notes"
    t.string   "practitioner",             default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "demographics", ["patient_id"], name: "index_demographics_on_patient_id"

  create_table "hearings", force: true do |t|
    t.integer  "patient_id"
    t.integer  "al"
    t.integer  "ad"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hearings", ["patient_id"], name: "index_hearings_on_patient_id"

  create_table "patients", force: true do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "middle_name"
    t.string   "gender",                              null: false
    t.date     "dob",                                 null: false
    t.string   "parent_permission"
    t.string   "parent_permission_desc"
    t.integer  "created_by",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physicals", force: true do |t|
    t.integer  "patient_id"
    t.string   "general_appearance"
    t.string   "head_hair"
    t.string   "skin"
    t.string   "eyes"
    t.string   "ears"
    t.string   "nose"
    t.string   "mouth"
    t.string   "throat"
    t.string   "thyroid"
    t.string   "lymph_pre_auricular"
    t.string   "lymph_post_auricular"
    t.string   "lymph_anterior_cervical"
    t.string   "lymph_occipital"
    t.string   "lymph_axillary"
    t.string   "vascular"
    t.string   "heart"
    t.string   "lungs"
    t.string   "abdomen"
    t.string   "musculoskeletal"
    t.string   "scoliosis_screening"
    t.string   "neuro"
    t.text     "additional_notes"
    t.string   "practitioner",            default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "physicals", ["patient_id"], name: "index_physicals_on_patient_id"

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "username",            default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.string   "role",                default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",          default: "", null: false
    t.string   "last_name",           default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "visions", force: true do |t|
    t.integer  "patient_id"
    t.integer  "ol"
    t.integer  "od"
    t.integer  "ou"
    t.boolean  "color_blindness",   default: false
    t.boolean  "corrective_lenses", default: false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visions", ["patient_id"], name: "index_visions_on_patient_id"

  create_table "vitals", force: true do |t|
    t.integer  "patient_id"
    t.integer  "height",         default: 0
    t.integer  "weight",         default: 0
    t.float    "bmi",            default: 0.0
    t.string   "blood_pressure", default: ""
    t.float    "hemoglobin",     default: 0.0
    t.float    "blood_glucose",  default: 0.0
    t.string   "practitioner",   default: "",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vitals", ["patient_id"], name: "index_vitals_on_patient_id"

end
