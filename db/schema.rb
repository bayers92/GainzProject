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

ActiveRecord::Schema.define(version: 20150714185724) do

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

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lifts", force: :cascade do |t|
    t.string   "description"
    t.integer  "rep_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "part_id"
    t.integer  "style"
  end

  add_index "lifts", ["part_id"], name: "index_lifts_on_part_id", using: :btree

  create_table "parts", force: :cascade do |t|
    t.integer  "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "style"
  end

  add_index "parts", ["workout_id"], name: "index_parts_on_workout_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.string   "result"
    t.integer  "user_id"
    t.integer  "lift_id"
    t.integer  "wod_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "scores", ["lift_id"], name: "index_scores_on_lift_id", using: :btree
  add_index "scores", ["user_id"], name: "index_scores_on_user_id", using: :btree
  add_index "scores", ["wod_id"], name: "index_scores_on_wod_id", using: :btree

  create_table "users", force: :cascade do |t|
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wods", force: :cascade do |t|
    t.text     "description"
    t.string   "result_label"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.integer  "part_id"
  end

  add_index "wods", ["part_id"], name: "index_wods_on_part_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.string   "title"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "workouts", ["admin_id"], name: "index_workouts_on_admin_id", using: :btree

  add_foreign_key "lifts", "parts"
  add_foreign_key "parts", "workouts"
  add_foreign_key "scores", "lifts"
  add_foreign_key "scores", "users"
  add_foreign_key "scores", "wods"
  add_foreign_key "wods", "parts"
  add_foreign_key "workouts", "admins"
end
