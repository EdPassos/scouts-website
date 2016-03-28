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

ActiveRecord::Schema.define(version: 20160328184915) do

  create_table "adventures", force: :cascade do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.integer  "photo_album_id"
    t.integer  "post_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "adventures", ["photo_album_id"], name: "index_adventures_on_photo_album_id"
  add_index "adventures", ["post_id"], name: "index_adventures_on_post_id"

  create_table "adventures_people", id: false, force: :cascade do |t|
    t.integer "adventure_id"
    t.integer "person_id"
  end

  add_index "adventures_people", ["adventure_id"], name: "index_adventures_people_on_adventure_id"
  add_index "adventures_people", ["person_id"], name: "index_adventures_people_on_person_id"

  create_table "camp_nights", force: :cascade do |t|
    t.integer  "adventure_id"
    t.integer  "person_id"
    t.integer  "nights"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "camp_nights", ["adventure_id"], name: "index_camp_nights_on_adventure_id"
  add_index "camp_nights", ["person_id"], name: "index_camp_nights_on_person_id"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  create_table "categories_posts", force: :cascade do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  add_index "categories_posts", ["category_id"], name: "index_categories_posts_on_category_id"
  add_index "categories_posts", ["post_id"], name: "index_categories_posts_on_post_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_names"
    t.date     "birthday"
    t.integer  "caretaker_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "section_id"
    t.integer  "team_id"
  end

  add_index "people", ["section_id"], name: "index_people_on_section_id"
  add_index "people", ["team_id"], name: "index_people_on_team_id"
  add_index "people", ["user_id"], name: "index_people_on_user_id"

  create_table "photo_albums", force: :cascade do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "photo_album_id"
  end

  add_index "photos", ["photo_album_id"], name: "index_photos_on_photo_album_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "draft"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.boolean  "public"
  end

  create_table "shop_order_statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shop_orders", force: :cascade do |t|
    t.integer  "shop_order_status_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.string   "proof_file_name"
    t.string   "proof_content_type"
    t.integer  "proof_file_size"
    t.datetime "proof_updated_at"
  end

  add_index "shop_orders", ["shop_order_status_id"], name: "index_shop_orders_on_shop_order_status_id"
  add_index "shop_orders", ["user_id"], name: "index_shop_orders_on_user_id"

  create_table "shop_products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",              precision: 7, scale: 2
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "shopping_cart_products", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shop_product_id"
    t.integer  "quantity"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "shop_order_id"
  end

  add_index "shopping_cart_products", ["shop_order_id"], name: "index_shopping_cart_products_on_shop_order_id"
  add_index "shopping_cart_products", ["shop_product_id"], name: "index_shopping_cart_products_on_shop_product_id"
  add_index "shopping_cart_products", ["user_id"], name: "index_shopping_cart_products_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "section_id"
  end

  add_index "teams", ["section_id"], name: "index_teams_on_section_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
