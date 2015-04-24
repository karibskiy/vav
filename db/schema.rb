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

ActiveRecord::Schema.define(version: 20140717093115) do

  create_table "addresses", force: true do |t|
    t.integer  "uid"
    t.string   "alias"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "uid"
    t.integer  "pid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "uid"
    t.integer  "pid"
    t.boolean  "pickup"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "date"
    t.string   "building_no"
    t.string   "street_name"
    t.string   "locality_name"
    t.string   "city"
    t.integer  "pincode"
    t.integer  "mobile"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "quantity"
    t.text     "desc"
    t.string   "pic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
