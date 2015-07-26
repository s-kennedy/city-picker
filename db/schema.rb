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

ActiveRecord::Schema.define(version: 20150726161435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "population"
    t.integer  "city_id"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "country_code"
    t.string   "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: :cascade do |t|
    t.string   "city1"
    t.string   "city1_query1"
    t.string   "city1_query2"
    t.string   "city1_query3"
    t.string   "city1_mcdonalds"
    t.string   "city2"
    t.string   "city2_query1"
    t.string   "city2_query2"
    t.string   "city2_query3"
    t.string   "city2_mcdonalds"
    t.string   "response_id"
    t.string   "query1"
    t.string   "query2"
    t.string   "query3"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
  end

end
