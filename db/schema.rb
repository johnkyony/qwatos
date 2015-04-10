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

ActiveRecord::Schema.define(version: 20141230133439) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "youtube_channel"
    t.string   "sound_cloud"
    t.string   "avatar_url"
  end

  create_table "dislikes", force: true do |t|
    t.integer  "user_id"
    t.integer  "qwato_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dislikes", ["qwato_id"], name: "index_dislikes_on_qwato_id"
  add_index "dislikes", ["user_id"], name: "index_dislikes_on_user_id"

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "qwato_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["qwato_id"], name: "index_likes_on_qwato_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "qwatos", force: true do |t|
    t.text     "quote"
    t.string   "image_url"
    t.datetime "uploaded_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
  end

  add_index "qwatos", ["artist_id"], name: "index_qwatos_on_artist_id"
  add_index "qwatos", ["user_id"], name: "index_qwatos_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
