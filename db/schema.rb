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

ActiveRecord::Schema.define(version: 20141130140332) do

  create_table "attachments", force: true do |t|
    t.text     "attach_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.integer  "attach_packet_id"
    t.string   "attach_desc"
  end

  create_table "attachpackets", force: true do |t|
    t.boolean  "visible"
    t.text     "packet_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "content_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.integer  "source_id"
  end

  add_index "comments", ["content_id"], name: "index_comments_on_content_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contents", force: true do |t|
    t.text     "text"
    t.integer  "source_id"
    t.integer  "comments_count"
    t.float    "longitude",        limit: 24
    t.float    "latitude",         limit: 24
    t.integer  "user_id"
    t.integer  "attach_packet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forwards_count"
  end

  add_index "contents", ["attach_packet_id"], name: "index_contents_on_attach_packet_id", using: :btree
  add_index "contents", ["user_id"], name: "index_contents_on_user_id", using: :btree

  create_table "user_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "firend_id"
    t.integer  "relation"
    t.date     "follow_time"
    t.date     "followed_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_relations", ["firend_id"], name: "index_user_relations_on_firend_id", using: :btree
  add_index "user_relations", ["user_id"], name: "index_user_relations_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "remark"
    t.datetime "created_at"
    t.string   "description"
    t.datetime "updated_at"
    t.string   "portrait_uri_file_name"
    t.string   "portrait_uri_content_type"
    t.integer  "portrait_uri_file_size"
    t.datetime "portrait_uri_updated_at"
    t.text     "passsalt"
    t.string   "gender"
    t.string   "online_status"
  end

end
