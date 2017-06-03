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

ActiveRecord::Schema.define(version: 20160404113535) do

  create_table "adventures", force: :cascade do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.integer  "photo_album_id"
    t.integer  "post_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["photo_album_id"], name: "index_adventures_on_photo_album_id"
    t.index ["post_id"], name: "index_adventures_on_post_id"
  end

  create_table "adventures_people", id: false, force: :cascade do |t|
    t.integer "adventure_id"
    t.integer "person_id"
    t.index ["adventure_id"], name: "index_adventures_people_on_adventure_id"
    t.index ["person_id"], name: "index_adventures_people_on_person_id"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "borrowed_to_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["borrowed_to_id"], name: "index_books_on_borrowed_to_id"
  end

  create_table "camp_nights", force: :cascade do |t|
    t.integer  "adventure_id"
    t.integer  "person_id"
    t.integer  "nights"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["adventure_id"], name: "index_camp_nights_on_adventure_id"
    t.index ["person_id"], name: "index_camp_nights_on_person_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  create_table "categories_posts", force: :cascade do |t|
    t.integer "category_id"
    t.integer "post_id"
    t.index ["category_id"], name: "index_categories_posts_on_category_id"
    t.index ["post_id"], name: "index_categories_posts_on_post_id"
  end

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
    t.index ["section_id"], name: "index_people_on_section_id"
    t.index ["team_id"], name: "index_people_on_team_id"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

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
    t.index ["photo_album_id"], name: "index_photos_on_photo_album_id"
  end

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
    t.datetime "published_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

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
    t.index ["shop_order_status_id"], name: "index_shop_orders_on_shop_order_status_id"
    t.index ["user_id"], name: "index_shop_orders_on_user_id"
  end

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
    t.index ["shop_order_id"], name: "index_shopping_cart_products_on_shop_order_id"
    t.index ["shop_product_id"], name: "index_shopping_cart_products_on_shop_product_id"
    t.index ["user_id"], name: "index_shopping_cart_products_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "section_id"
    t.index ["section_id"], name: "index_teams_on_section_id"
  end

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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

end
