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

ActiveRecord::Schema.define(version: 2019_08_18_153833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.text "body", null: false
    t.boolean "correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passed_tests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "correct_questions", default: 0
    t.bigint "question_id"
    t.index ["question_id"], name: "index_passed_tests_on_question_id"
    t.index ["test_id"], name: "index_passed_tests_on_test_id"
    t.index ["user_id", "test_id"], name: "index_passed_tests_on_user_id_and_test_id"
    t.index ["user_id"], name: "index_passed_tests_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "test_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "title", null: false
    t.integer "level", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_tests_on_author_id"
    t.index ["category_id"], name: "index_tests_on_category_id"
    t.index ["title", "level"], name: "index_tests_on_title_and_level", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "password_digest"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "passed_tests", "questions"
  add_foreign_key "passed_tests", "tests"
  add_foreign_key "passed_tests", "users"
  add_foreign_key "questions", "tests"
  add_foreign_key "tests", "categories"
  add_foreign_key "tests", "users", column: "author_id"
end
