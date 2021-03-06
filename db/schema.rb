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

ActiveRecord::Schema.define(version: 20150617111720) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "post"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "carbs", force: true do |t|
    t.integer  "valeur"
    t.string   "note"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carbs", ["user_id"], name: "index_carbs_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "glycemies", force: true do |t|
    t.integer  "valeur"
    t.string   "note"
    t.integer  "user_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hyper"
    t.boolean  "hypo"
  end

  add_index "glycemies", ["user_id"], name: "index_glycemies_on_users_id", using: :btree

  create_table "insulines", force: true do |t|
    t.string   "name"
    t.integer  "unit"
    t.date     "date"
    t.string   "note"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "insulines", ["user_id"], name: "index_insulines_on_user_id", using: :btree

  create_table "medecins", force: true do |t|
    t.datetime "rdv"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medecins", ["user_id"], name: "index_medecins_on_user_id", using: :btree

  create_table "oculistes", force: true do |t|
    t.datetime "rdv"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oculistes", ["user_id"], name: "index_oculistes_on_user_id", using: :btree

  create_table "prisedesangs", force: true do |t|
    t.datetime "rdv"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prisedesangs", ["user_id"], name: "index_prisedesangs_on_user_id", using: :btree

  create_table "results", force: true do |t|
    t.decimal  "hb",         precision: 3, scale: 1
    t.text     "note"
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["user_id"], name: "index_results_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "username"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
