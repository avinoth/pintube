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

ActiveRecord::Schema.define(version: 20160311032557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boards", ["name"], name: "index_boards_on_name", unique: true, using: :btree

  create_table "groupings", force: :cascade do |t|
    t.integer  "board_id",   null: false
    t.integer  "video_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groupings", ["board_id", "video_id"], name: "index_groupings_on_board_id_and_video_id", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.string   "tags",                     array: true
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "videos", ["url"], name: "index_videos_on_url", unique: true, using: :btree

end
