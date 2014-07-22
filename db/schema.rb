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

ActiveRecord::Schema.define(version: 20140722174802) do

  create_table "allergies", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "allergies", ["user_id"], name: "index_allergies_on_user_id"

  create_table "diseases", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diseases", ["user_id"], name: "index_diseases_on_user_id"

  create_table "remedies", force: true do |t|
    t.string   "quantidade"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "remedies", ["user_id"], name: "index_remedies_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "sangue"
    t.string   "peso"
    t.string   "altura"
    t.string   "pressao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
