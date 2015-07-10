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

ActiveRecord::Schema.define(version: 20150710151755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "lifts", force: :cascade do |t|
    t.integer  "type"
    t.string   "description"
    t.integer  "rep_count"
    t.integer  "workout_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lifts", ["workout_id"], name: "index_lifts_on_workout_id", using: :btree

  create_table "wods", force: :cascade do |t|
    t.text     "description"
    t.string   "result_label"
    t.integer  "workout_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "wods", ["workout_id"], name: "index_wods_on_workout_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.string   "title"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "workouts", ["admin_id"], name: "index_workouts_on_admin_id", using: :btree

  add_foreign_key "lifts", "workouts"
  add_foreign_key "wods", "workouts"
  add_foreign_key "workouts", "admins"
end
