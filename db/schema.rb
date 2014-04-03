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

ActiveRecord::Schema.define(version: 20140403183205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "links", force: true do |t|
    t.string   "title",        null: false
    t.string   "url",          null: false
    t.text     "body"
    t.integer  "submitter_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["submitter_id"], name: "index_links_on_submitter_id", using: :btree
  add_index "links", ["title"], name: "index_links_on_title", using: :btree

  create_table "subs", force: true do |t|
    t.string   "name",       null: false
    t.integer  "mod_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subs", ["mod_id"], name: "index_subs_on_mod_id", using: :btree
  add_index "subs", ["name"], name: "index_subs_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
