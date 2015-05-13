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

ActiveRecord::Schema.define(version: 20150506211414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "start_date"
    t.string   "agreement_details"
    t.string   "payer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agreements_users", id: false, force: :cascade do |t|
    t.integer "user_id",      null: false
    t.integer "agreement_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "postal_code"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end