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

ActiveRecord::Schema.define(version: 20140428044534) do

  create_table "donations", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "donation_type_id"
    t.string   "donation_type_type"
    t.integer  "donor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "donors", ["email"], name: "index_donors_on_email", unique: true
  add_index "donors", ["reset_password_token"], name: "index_donors_on_reset_password_token", unique: true

  create_table "experience_donations", force: true do |t|
    t.string   "contact"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physical_donations", force: true do |t|
    t.integer  "height"
    t.integer  "width"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voucher_donations", force: true do |t|
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
