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

ActiveRecord::Schema.define(version: 20161004185305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_answers", force: :cascade do |t|
    t.integer  "applying_id"
    t.text     "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["applying_id"], name: "index_application_answers_on_applying_id", using: :btree
  end

  create_table "application_questions", force: :cascade do |t|
    t.string   "question"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "company_id"
    t.integer  "applying_id"
    t.integer  "position"
    t.index ["applying_id"], name: "index_application_questions_on_applying_id", using: :btree
    t.index ["company_id"], name: "index_application_questions_on_company_id", using: :btree
  end

  create_table "applyings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "answer_field"
    t.index ["company_id"], name: "index_applyings_on_company_id", using: :btree
    t.index ["user_id"], name: "index_applyings_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "company_user_id"
    t.integer  "user_id"
    t.string   "picture"
    t.string   "tag_line"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.index ["company_user_id"], name: "index_companies_on_company_user_id", using: :btree
    t.index ["user_id"], name: "index_companies_on_user_id", using: :btree
  end

  create_table "company_questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "company_name"
    t.integer  "company_id"
    t.index ["company_id"], name: "index_company_users_on_company_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "site_admin"
    t.boolean  "company_admin"
    t.string   "company_name"
    t.text     "company_description"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "application_answers", "applyings"
  add_foreign_key "application_questions", "applyings"
  add_foreign_key "application_questions", "companies"
  add_foreign_key "applyings", "companies"
  add_foreign_key "applyings", "users"
  add_foreign_key "companies", "company_users"
  add_foreign_key "companies", "users"
  add_foreign_key "company_users", "companies"
end
