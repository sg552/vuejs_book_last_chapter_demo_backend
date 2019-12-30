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

ActiveRecord::Schema.define(version: 20171020105347) do

  create_table "buy_goods", force: true do |t|
    t.integer  "good_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "category_img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_category_id"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "member_user_id"
    t.integer  "good_id"
    t.string   "nickname"
    t.text     "content"
    t.boolean  "is_display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "open_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "first_categories", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.integer  "category_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price",          limit: 24
    t.float    "original_price", limit: 24
    t.float    "discount",       limit: 24
    t.string   "advertisement"
    t.integer  "inventory"
    t.text     "good_attribute"
    t.boolean  "is_display"
    t.boolean  "is_hot"
  end

  create_table "goods_photos", force: true do |t|
    t.integer  "good_id"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true, comment: "记录日志的表" do |t|
    t.string   "controller",     comment: "rails 控制器"
    t.string   "action",         comment: "rails action"
    t.string   "user_name",      comment: "当前登录用户名"
    t.text     "parameters",     comment: "rails的 params"
    t.datetime "created_at",     comment: "创建时间"
    t.string   "remote_ip",      comment: "远程IP"
    t.string   "restful_method", comment: "get/post/put/delete"
  end

  create_table "member_users", force: true do |t|
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

  add_index "member_users", ["email"], name: "index_member_users_on_email", unique: true, using: :btree
  add_index "member_users", ["reset_password_token"], name: "index_member_users_on_reset_password_token", unique: true, using: :btree

  create_table "orders", force: true do |t|
    t.string   "order_id"
    t.string   "receiver_name"
    t.string   "receiver_address"
    t.string   "receiver_phone"
    t.float    "total_cost",       limit: 24
    t.boolean  "order_status"
    t.string   "guest_remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "payed_price",      limit: 24
    t.string   "payed_at"
    t.text     "payed_response"
    t.integer  "customer_id"
    t.boolean  "is_dispatch",                 default: false
    t.integer  "user_address_id"
    t.integer  "member_user_id"
    t.string   "mode_of_payment"
  end

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shop_cart_goods", force: true do |t|
    t.integer  "good_id"
    t.integer  "shop_cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_cart_good_quantity"
  end

  create_table "shop_carts", force: true do |t|
    t.integer  "member_user_id"
    t.integer  "buy_quantity"
    t.boolean  "is_create_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "towns", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_addresses", force: true do |t|
    t.integer  "member_user_id"
    t.string   "name"
    t.string   "post_code"
    t.string   "region"
    t.string   "detail_address"
    t.string   "phone_number"
    t.string   "fixed_telephone"
    t.string   "email"
    t.string   "delivery_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "belongs_to_street"
    t.string   "address_sign"
    t.boolean  "is_default",        default: false
    t.integer  "province_id"
    t.integer  "city_id"
    t.integer  "town_id"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
