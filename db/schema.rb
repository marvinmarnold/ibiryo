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

ActiveRecord::Schema.define(:version => 20121115140832) do

  create_table "contacts", :force => true do |t|
    t.string   "type"
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.string   "nickname"
    t.string   "street"
    t.string   "room"
    t.string   "province"
    t.string   "district"
    t.string   "city"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.text     "directions"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "contacts", ["contactable_id", "contactable_type"], :name => "index_contacts_on_contactable_id_and_contactable_type"

  create_table "currencies", :force => true do |t|
    t.string   "locale_abbr"
    t.string   "abbr"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "descriptions", :force => true do |t|
    t.integer  "locale_id"
    t.string   "name"
    t.integer  "describable_id"
    t.string   "describable_type"
    t.text     "body"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "descriptions", ["describable_id", "describable_type"], :name => "index_descriptions_on_describable_id_and_describable_type"
  add_index "descriptions", ["locale_id"], :name => "index_descriptions_on_locale_id"

  create_table "feedbacks", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "subject"
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "feedbacks", ["user_id"], :name => "index_feedbacks_on_user_id"

  create_table "locales", :force => true do |t|
    t.string   "language"
    t.string   "abbr"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "managements", :force => true do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "managements", ["shop_id"], :name => "index_managements_on_shop_id"
  add_index "managements", ["user_id"], :name => "index_managements_on_user_id"

  create_table "marketing_strategies", :force => true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "menu_sections", :force => true do |t|
    t.integer  "menu_id"
    t.boolean  "is_active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "menu_sections", ["menu_id"], :name => "index_menu_sections_on_menu_id"

  create_table "menus", :force => true do |t|
    t.integer  "shop_id"
    t.boolean  "is_active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "menus", ["shop_id"], :name => "index_menus_on_shop_id"

  create_table "participations", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "marketing_strategy_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "participations", ["marketing_strategy_id"], :name => "index_participations_on_marketing_strategy_id"
  add_index "participations", ["shop_id"], :name => "index_participations_on_shop_id"

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shops", :force => true do |t|
    t.string   "thumbnail"
    t.string   "banner"
    t.integer  "currency_id"
    t.float    "delivery_minimum"
    t.float    "delivery_fee"
    t.time     "opens_sunday_at"
    t.time     "closes_sunday_at"
    t.time     "checkin_at"
    t.time     "checkout_at"
    t.boolean  "is_active"
    t.time     "opens_monday_at"
    t.time     "closes_monday_at"
    t.time     "opens_tuesday_at"
    t.time     "closes_tuesday_at"
    t.time     "opens_wednesday_at"
    t.time     "closes_wednesday_at"
    t.time     "opens_thursday_at"
    t.time     "closes_thursday_at"
    t.time     "opens_friday_at"
    t.time     "closes_friday_at"
    t.time     "opens_saturday_at"
    t.time     "closes_saturday_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "shops", ["currency_id"], :name => "index_shops_on_currency_id"

  create_table "supervisions", :force => true do |t|
    t.integer  "salesmanager_id"
    t.integer  "salesperson_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "supervisions", ["salesmanager_id"], :name => "index_supervisions_on_salesmanager_id"
  add_index "supervisions", ["salesperson_id"], :name => "index_supervisions_on_salesperson_id"

  create_table "synonyms", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "shop_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["shop_id"], :name => "index_taggings_on_shop_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "synonym_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["synonym_id"], :name => "index_tags_on_synonym_id"

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
    t.integer  "default_locale_id"
    t.string   "type"
    t.string   "temp_session_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["default_locale_id"], :name => "index_users_on_default_locale_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
