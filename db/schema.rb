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

ActiveRecord::Schema.define(version: 20141121084157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_items", force: true do |t|
    t.integer  "answer_id",    null: false
    t.integer  "vote_item_id", null: false
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_items", ["answer_id"], name: "index_answer_items_on_answer_id", using: :btree
  add_index "answer_items", ["vote_item_id"], name: "index_answer_items_on_vote_item_id", using: :btree

  create_table "answers", force: true do |t|
    t.integer  "vote_id"
    t.string   "user_name",  null: false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["vote_id"], name: "index_answers_on_vote_id", using: :btree

  create_table "vote_items", force: true do |t|
    t.string   "name",       null: false
    t.text     "addition"
    t.integer  "vote_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_items", ["vote_id"], name: "index_vote_items_on_vote_id", using: :btree

  create_table "votes", force: true do |t|
    t.string   "title",                       null: false
    t.text     "description"
    t.string   "password",                    null: false
    t.boolean  "closed",      default: false, null: false
    t.string   "uuid",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["uuid"], name: "index_votes_on_uuid", unique: true, using: :btree

end
