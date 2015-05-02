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

ActiveRecord::Schema.define(version: 20150502170152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "content",                 null: false
    t.integer  "user_id",                 null: false
    t.integer  "question_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points",      default: 0
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content",                      null: false
    t.integer  "user_id",                      null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points",           default: 0
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",       limit: 256,             null: false
    t.text     "content",                             null: false
    t.integer  "user_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points",                  default: 0
    t.integer  "best_answer"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 50, null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "is_up",        default: true
    t.integer  "user_id",                     null: false
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id", using: :btree

end
