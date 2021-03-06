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

ActiveRecord::Schema.define(:version => 20140122050710) do

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "email"
    t.string   "phone"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "website"
    t.string   "linkedin"
    t.string   "twitter"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "personal_email"
    t.string   "title"
    t.string   "cell"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "descriptors", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "mailchimp"
  end

  create_table "invitations", :force => true do |t|
    t.string   "recipient_email"
    t.integer  "sender_id"
    t.string   "token"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "recipient_first_name"
    t.string   "recipient_last_name"
  end

  create_table "mailchimps", :force => true do |t|
    t.string   "list_name"
    t.string   "list_id"
    t.integer  "group_id"
    t.integer  "tag_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "subscribe_method"
  end

  create_table "notes", :force => true do |t|
    t.string   "content"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "email"
    t.integer  "plan_id"
    t.string   "stripe_customer_token"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "group_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "group_id"
    t.integer  "invitation_id"
    t.boolean  "admin",                 :default => false
    t.string   "stripe_customer_token"
    t.integer  "plan_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

end
