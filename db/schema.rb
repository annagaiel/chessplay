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

ActiveRecord::Schema.define(version: 20160107121426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "white_player"
    t.integer  "black_player"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "days_per_turn"
    t.string   "play_as"
    t.string   "rated"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "offers", ["player_id"], name: "index_offers_on_player_id", using: :btree

  create_table "pieces", force: :cascade do |t|
    t.integer "x_position"
    t.integer "y_position"
    t.integer "player_id"
    t.integer "game_id"
    t.boolean "captured"
    t.string  "color"
  end

  add_index "pieces", ["game_id"], name: "index_pieces_on_game_id", using: :btree
  add_index "pieces", ["player_id"], name: "index_pieces_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
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
    t.string   "fullname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "offers", "players"
  add_foreign_key "pieces", "games"
  add_foreign_key "pieces", "players"
end
