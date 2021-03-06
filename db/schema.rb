# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_27_034021) do

  create_table "bear_call_spreads", force: :cascade do |t|
    t.decimal "ceiling1", precision: 8, scale: 2
    t.decimal "ceiling2", precision: 8, scale: 2
    t.decimal "strike", precision: 8, scale: 2
    t.date "expiration"
    t.integer "user_id"
    t.string "asset"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "open_comments"
    t.text "close_comments"
  end

  create_table "bull_put_spreads", force: :cascade do |t|
    t.decimal "floor1", precision: 8, scale: 2
    t.decimal "floor2", precision: 8, scale: 2
    t.decimal "strike", precision: 8, scale: 2
    t.date "expiration"
    t.integer "user_id"
    t.string "asset"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "open_comments"
    t.text "close_comments"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "company_id"
    t.integer "user_id"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price", precision: 8, scale: 2
  end

  create_table "companies", force: :cascade do |t|
    t.string "ticker"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equities", force: :cascade do |t|
    t.string "ticker"
    t.decimal "buy_price", precision: 8, scale: 2
    t.decimal "valuation", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "short_calls", force: :cascade do |t|
    t.decimal "ceiling1", precision: 8, scale: 2
    t.decimal "ceiling2", precision: 8, scale: 2
    t.decimal "strike", precision: 8, scale: 2
    t.date "expiration"
    t.string "asset"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "open_comments"
    t.text "close_comments"
  end

  create_table "short_puts", force: :cascade do |t|
    t.decimal "floor1", precision: 8, scale: 2
    t.decimal "floor2", precision: 8, scale: 2
    t.decimal "strike", precision: 8, scale: 2
    t.date "expiration"
    t.string "asset"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "open_comments"
    t.text "close_comments"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
