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

ActiveRecord::Schema.define(version: 20151229230705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.integer  "breed_id"
    t.string   "color"
    t.float    "amount"
    t.integer  "age"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "gender"
    t.string   "size"
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "name"
    t.string   "registry_number"
    t.string   "email"
    t.string   "address"
    t.string   "address_number"
    t.string   "complement"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "purchases_dogs", force: :cascade do |t|
    t.integer  "dog_id"
    t.integer  "purchase_id"
    t.integer  "quantity"
    t.float    "total_amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "purchases_dogs", ["dog_id"], name: "index_purchases_dogs_on_dog_id", using: :btree
  add_index "purchases_dogs", ["purchase_id"], name: "index_purchases_dogs_on_purchase_id", using: :btree

  add_foreign_key "purchases_dogs", "dogs"
  add_foreign_key "purchases_dogs", "purchases"
end
