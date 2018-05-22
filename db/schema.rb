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

ActiveRecord::Schema.define(version: 2018_05_21_123649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "star_id"
    t.date "arrival_date"
    t.date "departure_date"
    t.integer "trip_price"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["star_id"], name: "index_bookings_on_star_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "star_reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "user_id"
    t.bigint "star_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["star_id"], name: "index_star_reviews_on_star_id"
    t.index ["user_id"], name: "index_star_reviews_on_user_id"
  end

  create_table "stars", force: :cascade do |t|
    t.string "name"
    t.string "constellation"
    t.integer "water"
    t.integer "breathability"
    t.integer "asteroid_attack"
    t.integer "daylight"
    t.boolean "life_existence"
    t.text "description"
    t.integer "price_per_day"
    t.string "photos", default: [], array: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "username"
    t.string "avatar"
    t.boolean "human"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "stars"
  add_foreign_key "bookings", "users"
  add_foreign_key "star_reviews", "stars"
  add_foreign_key "star_reviews", "users"
  add_foreign_key "stars", "users"
end
