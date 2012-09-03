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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120903074956) do

  create_table "accuseds", :force => true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "sex"
    t.date     "date_of_birth"
    t.boolean  "known_to_complainant"
    t.integer  "relation_id"
    t.integer  "case_detail_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "case_details", :force => true do |t|
    t.integer  "prosecutor_id",        :null => false
    t.integer  "judge_id",             :null => false
    t.string   "rcci"
    t.string   "court_case_number",    :null => false
    t.integer  "court_type"
    t.date     "date_of_offence"
    t.integer  "region_id"
    t.integer  "constituency_id"
    t.date     "date_reported"
    t.date     "date_submitted"
    t.integer  "action_id"
    t.integer  "status_id"
    t.text     "comment"
    t.date     "date_trial_commenced"
    t.date     "date_trial_concluded"
    t.string   "judgment"
    t.string   "sentence"
    t.text     "reason_for_acquittal"
    t.string   "judge_remarks"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "user_id"
  end

  add_index "case_details", ["user_id"], :name => "index_case_details_on_user_id"

  create_table "case_details_charges", :id => false, :force => true do |t|
    t.integer "case_detail_id"
    t.integer "charge_id"
  end

  create_table "cases", :force => true do |t|
    t.integer  "prosecutor_id",        :null => false
    t.integer  "judge_id",             :null => false
    t.string   "rcci"
    t.string   "court_case_number",    :null => false
    t.integer  "court_type"
    t.date     "date_of_offence"
    t.integer  "region_id"
    t.integer  "constituency_id"
    t.date     "date_reported"
    t.date     "date_submitted"
    t.integer  "action_taken"
    t.integer  "status"
    t.text     "comment"
    t.date     "date_trial_commenced"
    t.date     "date_trial_concluded"
    t.string   "judgment"
    t.string   "sentence"
    t.text     "reason_for_acquittal"
    t.string   "judge_remarks"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "charges", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "complainants", :force => true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "sex"
    t.date     "date_of_birth"
    t.integer  "case_detail_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "constituencies", :force => true do |t|
    t.string  "name",      :null => false
    t.integer "region_id"
  end

  create_table "judges", :force => true do |t|
    t.string "first_name", :null => false
    t.string "surname",    :null => false
    t.string "sex"
  end

  create_table "prosecutors", :force => true do |t|
    t.string  "first_name"
    t.string  "surname"
    t.string  "sex"
    t.integer "region_id"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "regions", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "relations", :force => true do |t|
    t.string "name"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "statuses", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
