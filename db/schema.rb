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

ActiveRecord::Schema.define(version: 20180125160044) do

  create_table "input_mappings", force: :cascade do |t|
    t.string "outbound"
    t.string "mapping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "latex_mappings", force: :cascade do |t|
    t.string "latex"
    t.string "mapping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mappings", force: :cascade do |t|
    t.string "logic"
    t.string "mapping"
  end

  create_table "practice_problems", force: :cascade do |t|
    t.string "problem_uid"
    t.string "premises"
    t.string "conclusion"
    t.string "category_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_uid"], name: "index_practice_problems_on_category_uid"
    t.index ["problem_uid"], name: "index_practice_problems_on_problem_uid"
  end

  create_table "problem_categories", force: :cascade do |t|
    t.string "category_uid"
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_uid"], name: "index_problem_categories_on_category_uid"
  end

  create_table "profile_problem_junctions", force: :cascade do |t|
    t.string "profile_uid"
    t.string "problem_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_uid"], name: "index_profile_problem_junctions_on_profile_uid"
  end

  create_table "response_mappings", force: :cascade do |t|
    t.string "logic"
    t.string "mapping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
