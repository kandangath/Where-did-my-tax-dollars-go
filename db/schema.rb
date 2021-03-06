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

ActiveRecord::Schema.define(:version => 20101204233227) do

  create_table "fica_tax_rates", :force => true do |t|
    t.integer "year"
    t.float   "oasdi_rate"
    t.float   "oasdi_upper_limit"
    t.float   "hi_rate"
  end

  create_table "filing_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "standard_deduction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seca_tax_rates", :force => true do |t|
    t.integer "year"
    t.float   "oasdi_rate"
    t.float   "oasdi_upper_limit"
    t.float   "hi_rate"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "spending_categories", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spending_rates", :force => true do |t|
    t.integer  "spending_category_id"
    t.string   "name",                 :default => "",  :null => false
    t.text     "description"
    t.integer  "year",                                  :null => false
    t.float    "amount",               :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tax_rates", :force => true do |t|
    t.integer  "year"
    t.integer  "filing_category_id"
    t.float    "marginal_rate"
    t.decimal  "lower_limit",        :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "perishable_token",    :default => "",    :null => false
    t.boolean  "verified",            :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
