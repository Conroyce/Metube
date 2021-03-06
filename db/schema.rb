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

ActiveRecord::Schema.define(version: 20141227002957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "video_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
  end

  add_index "comments", ["video_id"], name: "index_comments_on_video_id", using: :btree

  create_table "playlist_vids", force: true do |t|
    t.integer  "video_id"
    t.integer  "playlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "playlist_vids", ["playlist_id"], name: "index_playlist_vids_on_playlist_id", using: :btree
  add_index "playlist_vids", ["video_id"], name: "index_playlist_vids_on_video_id", using: :btree

  create_table "playlists", force: true do |t|
    t.string   "title"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "playlists", ["comment_id"], name: "index_playlists_on_comment_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
