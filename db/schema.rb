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

ActiveRecord::Schema.define(version: 20191118093031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "employeeid"
    t.string   "mobileno"
    t.string   "gender"
    t.string   "address"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "relyon", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "role",                   default: "user"
  end

  create_table "leave_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaves", force: :cascade do |t|
    t.integer  "cl"
    t.integer  "sl"
    t.integer  "lop"
    t.integer  "payday"
    t.integer  "weekoff"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
    t.integer  "count"
    t.integer  "applied_leaves"
    t.integer  "remaining_leaves"
    t.integer  "week_off"
    t.integer  "present_days"
    t.integer  "total_applied_leaves"
    t.integer  "employee_id"
    t.integer  "total_lop"
  end

  add_index "leaves", ["employee_id"], name: "index_leaves_on_employee_id", using: :btree

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.hstore  "salary_hash"
    t.hstore  "total_earning_hash"
    t.hstore  "total_deduction_hash"
    t.float   "net_salary"
    t.integer "employee_id"
  end

  add_index "salaries", ["employee_id"], name: "index_salaries_on_employee_id", using: :btree

  create_table "salary_allotments", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "salary_head_id"
    t.integer  "employee_id"
    t.integer  "amount"
    t.hstore   "salary_head_hash"
  end

  add_index "salary_allotments", ["employee_id"], name: "index_salary_allotments_on_employee_id", using: :btree
  add_index "salary_allotments", ["salary_head_id"], name: "index_salary_allotments_on_salary_head_id", using: :btree

  create_table "salary_deductions", force: :cascade do |t|
    t.integer  "pf"
    t.integer  "esi"
    t.integer  "pt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salary_heads", force: :cascade do |t|
    t.string   "salaryname"
    t.boolean  "earnings",   default: false
    t.boolean  "deduction",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_foreign_key "leaves", "employees"
  add_foreign_key "salaries", "employees"
  add_foreign_key "salary_allotments", "employees"
  add_foreign_key "salary_allotments", "salary_heads"
end
