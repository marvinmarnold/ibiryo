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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121109103453) do

  create_table "feedbacks", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "subject"
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "feedbacks", ["user_id"], :name => "index_feedbacks_on_user_id"

  create_table "managements", :force => true do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "managements", ["shop_id"], :name => "index_managements_on_shop_id"
  add_index "managements", ["user_id"], :name => "index_managements_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shops", :force => true do |t|
    t.integer  "user_id"
    t.string   "thumbnail"
    t.string   "banner"
    t.string   "currency"
    t.float    "delivery_minimum"
    t.float    "delivery_fee"
    t.datetime "opens_sunday_at"
    t.datetime "closes_sunday_at"
    t.datetime "checkin_at"
    t.datetime "checkout_at"
    t.boolean  "is_active"
    t.datetime "opens_monday_at"
    t.datetime "closes_monday_at"
    t.datetime "opens_tuesday_at"
    t.datetime "closes_tuesday_at"
    t.datetime "opens_wednesday_at"
    t.datetime "closes_wednesday_at"
    t.datetime "opens_thursday_at"
    t.datetime "closes_thursday_at"
    t.datetime "opens_friday_at"
    t.datetime "closes_friday_at"
    t.datetime "opens_saturday_at"
    t.datetime "closes_saturday_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "shops", ["user_id"], :name => "index_shops_on_user_id"

  create_table "supervisions", :force => true do |t|
    t.integer  "salesmanager_id"
    t.integer  "salesperson_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "supervisions", ["salesmanager_id"], :name => "index_supervisions_on_salesmanager_id"
  add_index "supervisions", ["salesperson_id"], :name => "index_supervisions_on_salesperson_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "default_locale"
    t.string   "type"
    t.string   "temp_session_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
