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

ActiveRecord::Schema.define(version: 20150817133533) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "admins", ["email"], name: "index_admins_on_email"

  create_table "equipment", force: :cascade do |t|
    t.string   "tag"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "equipment", ["tag"], name: "index_equipment_on_tag"

  create_table "requests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "sid"
    t.integer  "equipment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "requests", ["equipment_id"], name: "index_requests_on_equipment_id"

  create_table "sign_ins", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sign_ins", ["admin_id", "request_id"], name: "index_sign_ins_on_admin_id_and_request_id", unique: true
  add_index "sign_ins", ["admin_id"], name: "index_sign_ins_on_admin_id"
  add_index "sign_ins", ["request_id"], name: "index_sign_ins_on_request_id"

  create_table "sign_outs", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sign_outs", ["admin_id", "request_id"], name: "index_sign_outs_on_admin_id_and_request_id", unique: true
  add_index "sign_outs", ["admin_id"], name: "index_sign_outs_on_admin_id"
  add_index "sign_outs", ["request_id"], name: "index_sign_outs_on_request_id"

end
