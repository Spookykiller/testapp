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

ActiveRecord::Schema.define(version: 20170103112503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annualaccounts", force: :cascade do |t|
    t.datetime "an_date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.decimal  "an_pr_interest",     default: 0.0, null: false
    t.decimal  "an_pr_depreciation", default: 0.0, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "article_code"
    t.string   "article_description"
    t.string   "article_unit"
    t.decimal  "article_VAT_percentage"
    t.decimal  "article_unit_price"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "client_number"
    t.string   "client_zipcode"
    t.string   "client_residence"
    t.boolean  "client_gender"
    t.string   "client_phone"
    t.string   "client_email"
    t.string   "client_account_number"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "client_first_name"
    t.string   "client_last_name"
    t.string   "client_street"
    t.integer  "client_street_number"
    t.string   "client_street_addition"
    t.string   "client_company_name"
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "company_number"
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_zipcode"
    t.string   "company_place"
    t.string   "company_phone"
    t.string   "company_email"
    t.string   "company_webaddress"
    t.string   "company_bank_account_number"
    t.string   "company_bank"
    t.string   "company_VAT_number"
    t.string   "company_CC_number"
    t.string   "company_kilometer_compensation"
    t.boolean  "company_business_car"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "company_logo_file_name"
    t.string   "company_logo_content_type"
    t.integer  "company_logo_file_size"
    t.datetime "company_logo_updated_at"
    t.integer  "administration_code"
    t.text     "payment_terms"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "invoice_number"
    t.datetime "invoice_date"
    t.string   "invoice_client_name"
    t.string   "invoice_subject"
    t.string   "invoice_VAT_number"
    t.integer  "invoice_VAT_percentage"
    t.decimal  "invoice_exclusive_VAT"
    t.decimal  "invoice_VAT"
    t.decimal  "invoice_including_VAT"
    t.datetime "invoice_when_paid"
    t.decimal  "invoice_paid"
    t.decimal  "invoice_left"
    t.boolean  "invoice_definitive"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.decimal  "VAT6"
    t.decimal  "VAT21"
    t.boolean  "offer"
    t.decimal  "subtotal_0"
    t.decimal  "subtotal_6"
    t.decimal  "subtotal_21"
  end

  create_table "items", force: :cascade do |t|
    t.string   "item_code"
    t.string   "item_description"
    t.string   "item_unit"
    t.decimal  "item_quantity"
    t.decimal  "item_unit_cost"
    t.integer  "item_VAT_percentage"
    t.decimal  "item_total_price"
    t.integer  "invoice_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "items", ["invoice_id"], name: "index_items_on_invoice_id", using: :btree

  create_table "mileages", force: :cascade do |t|
    t.boolean  "mileage_retour"
    t.datetime "mileage_date"
    t.string   "mileage_from"
    t.string   "mileage_to"
    t.decimal  "mileage_kilometers"
    t.decimal  "mileage_total_kilometers"
    t.boolean  "mileage_billable"
    t.decimal  "mileage_compensation_rate", default: 0.19
    t.decimal  "mileage_compensation"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "project_number"
    t.string   "project_name"
    t.string   "project_client"
    t.decimal  "project_budget"
    t.decimal  "project_hour_rate"
    t.decimal  "project_billable"
    t.decimal  "project_non_billable"
    t.decimal  "project_residual"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "spendings", force: :cascade do |t|
    t.integer  "spending_follow_number"
    t.datetime "spending_date"
    t.string   "spending_company_name"
    t.string   "spending_cost_description"
    t.string   "spending_invoice_number_creditor"
    t.string   "spending_type"
    t.decimal  "spending_VAT_percentage"
    t.decimal  "spending_exclusive_VAT"
    t.decimal  "spending_VAT"
    t.decimal  "spending_including_VAT"
    t.datetime "spending_when_paid"
    t.decimal  "spending_paid"
    t.decimal  "spending_left"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "subdomains", force: :cascade do |t|
    t.string   "subdomain_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "timesheets", force: :cascade do |t|
    t.integer  "timesheet_project_number"
    t.string   "timesheet_name"
    t.string   "timesheet_description"
    t.datetime "timesheet_date"
    t.decimal  "timesheet_hours"
    t.boolean  "timesheet_billable"
    t.string   "timesheet_comment"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "user_name"
    t.boolean  "user_gender"
    t.string   "user_function"
    t.string   "user_phone"
    t.integer  "user_number"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "company_id"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.datetime "locked_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "allowed_to_log_in"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "items", "invoices"
  add_foreign_key "users", "companies"
end
