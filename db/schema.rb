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

ActiveRecord::Schema.define(version: 2020_09_11_011454) do

  create_table "bull_put_spreads", force: :cascade do |t|
    t.decimal "floor1", precision: 8, scale: 2
    t.decimal "floor2", precision: 8, scale: 2
    t.decimal "strike", precision: 8, scale: 2
    t.date "expiration"
    t.integer "user_id"
    t.string "asset"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
