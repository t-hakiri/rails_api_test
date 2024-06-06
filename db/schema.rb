# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_19_164842) do
  create_table "consume_items", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_group_lottery_machines", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "item_group_id", null: false
    t.integer "item_quantity", null: false
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.float "weight", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_group_id"], name: "index_item_group_lottery_machines_on_item_group_id"
    t.index ["item_type", "item_id"], name: "index_item_group_lottery_machines_on_item_type_and_item_id"
  end

  create_table "item_groups", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "received_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type", "item_id"], name: "index_received_items_on_item_type_and_item_id"
    t.index ["user_id"], name: "index_received_items_on_user_id"
  end

  create_table "treasure_boxes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "item_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_group_id"], name: "index_treasure_boxes_on_item_group_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_items", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "item_group_lottery_machines", "item_groups"
  add_foreign_key "received_items", "users"
  add_foreign_key "treasure_boxes", "item_groups"
end
