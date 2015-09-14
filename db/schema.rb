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

ActiveRecord::Schema.define(version: 20150914220913) do

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.string   "activation_token"
    t.string   "recovery_token"
    t.string   "phone"
    t.string   "celphone"
    t.boolean  "is_blocked"
    t.integer  "consultant_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "profile_id"
    t.string   "email_secondary"
    t.string   "cpf"
    t.string   "rg"
    t.string   "issuer"
    t.date     "birthday"
    t.integer  "civil_state_id"
    t.integer  "nationality_id"
    t.string   "profession"
    t.string   "zip_code"
    t.string   "street"
    t.string   "complement"
    t.string   "district"
    t.integer  "graduation_id"
    t.string   "father"
    t.string   "mother"
    t.string   "wife"
    t.string   "wife_cpf"
    t.date     "wife_birthday"
    t.string   "company"
    t.string   "cnpj"
    t.string   "company_zip_code"
    t.integer  "company_city_id"
    t.string   "company_street"
    t.string   "company_district"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id"
  add_index "users", ["civil_state_id"], name: "index_users_on_civil_state_id"
  add_index "users", ["graduation_id"], name: "index_users_on_graduation_id"
  add_index "users", ["nationality_id"], name: "index_users_on_nationality_id"
  add_index "users", ["profile_id"], name: "index_users_on_profile_id"
  add_index "users", ["state_id"], name: "index_users_on_state_id"

end
