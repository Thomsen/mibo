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

ActiveRecord::Schema.define(version: 20141101135709) do

  create_table "contents", force: true do |t|
    t.text     "text"
    t.datetime "create_at"
    t.integer  "source_id"
    t.integer  "reposts_count"
    t.integer  "comments_count"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "user_id"
    t.integer  "respacket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["respacket_id"], name: "index_contents_on_respacket_id"
  add_index "contents", ["user_id"], name: "index_contents_on_user_id"

  create_table "resources", force: true do |t|
    t.string   "res_name"
    t.string   "res_uri"
    t.string   "res_desc"
    t.integer  "respacket_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["respacket_id_id"], name: "index_resources_on_respacket_id_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.integer  "gender"
    t.string   "email"
    t.string   "remark"
    t.integer  "online_status"
    t.datetime "created_at"
    t.string   "description"
    t.datetime "updated_at"
    t.string   "portrait_uri_file_name"
    t.string   "portrait_uri_content_type"
    t.integer  "portrait_uri_file_size"
    t.datetime "portrait_uri_updated_at"
  end

end
