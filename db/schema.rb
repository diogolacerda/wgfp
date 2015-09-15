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

ActiveRecord::Schema.define(version: 20150915203648) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "civil_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graduations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investment_answers", force: :cascade do |t|
    t.string   "answer"
    t.integer  "investment_question_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "investment_answers", ["investment_question_id"], name: "index_investment_answers_on_investment_question_id"

  create_table "investment_answers_users", force: :cascade do |t|
    t.integer "investment_answer_id"
    t.integer "user_id"
  end

  add_index "investment_answers_users", ["investment_answer_id"], name: "index_investment_answers_users_on_investment_answer_id"
  add_index "investment_answers_users", ["user_id"], name: "index_investment_answers_users_on_user_id"

  create_table "nationalities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "objectives", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "objectives_users", force: :cascade do |t|
    t.integer "objective_id"
    t.integer "user_id"
  end

  add_index "objectives_users", ["objective_id"], name: "index_objectives_users_on_objective_id"
  add_index "objectives_users", ["user_id"], name: "index_objectives_users_on_user_id"

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
    t.integer  "company_state_id"
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
