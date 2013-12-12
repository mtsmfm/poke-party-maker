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

ActiveRecord::Schema.define(version: 20131212154626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parties", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties_pokemons", force: true do |t|
    t.integer "party_id"
    t.integer "pokemon_id"
  end

  add_index "parties_pokemons", ["party_id"], name: "index_parties_pokemons_on_party_id", using: :btree
  add_index "parties_pokemons", ["pokemon_id"], name: "index_parties_pokemons_on_pokemon_id", using: :btree

  create_table "pokemons", force: true do |t|
    t.integer  "pokedex_id",          null: false
    t.string   "name",                null: false
    t.string   "type1",               null: false
    t.string   "type2"
    t.boolean  "final",               null: false
    t.boolean  "available_in_rating", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
