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

ActiveRecord::Schema.define(version: 20141112153047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "option_select_logs", force: true do |t|
    t.integer  "option_id"
    t.integer  "viewer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", force: true do |t|
    t.text     "title"
    t.integer  "question_id"
    t.integer  "selection_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_file_name"
    t.string   "content_content_type"
    t.integer  "content_file_size"
    t.datetime "content_updated_at"
    t.integer  "result_id"
    t.boolean  "store_product"
    t.text     "store_link"
    t.string   "store_name"
    t.string   "store_price"
    t.date     "store_product_expiry_date"
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "title"
    t.integer  "quiz_id"
    t.integer  "view_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree

  create_table "quiz_view_logs", force: true do |t|
    t.integer  "quiz_id"
    t.integer  "viewer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "quizzes", force: true do |t|
    t.text     "title"
    t.integer  "view_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "result_prefix"
    t.string   "status"
  end

  create_table "result_view_logs", force: true do |t|
    t.integer  "result_id"
    t.integer  "viewer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "title"
    t.text     "description"
    t.integer  "viewings"
    t.integer  "quiz_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "viewers", force: true do |t|
    t.text     "name"
    t.integer  "quizzes_viewed"
    t.integer  "questions_viewed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret"
  end

end
