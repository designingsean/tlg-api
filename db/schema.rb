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

ActiveRecord::Schema.define(version: 0) do

  create_table "calls", force: true do |t|
    t.string   "name",      limit: 40
    t.string   "phone",     limit: 10
    t.text     "message"
    t.datetime "received"
    t.boolean  "completed",            default: false, null: false
  end

  create_table "checklist", force: true do |t|
    t.integer   "taskFreqId", null: false
    t.integer   "userId",     null: false
    t.timestamp "completed",  null: false
  end

  create_table "clocks", force: true do |t|
    t.integer  "uid",      null: false
    t.datetime "clockIn",  null: false
    t.datetime "clockOut"
  end

  create_table "notes", force: true do |t|
    t.integer  "callID",    null: false
    t.integer  "userID",    null: false
    t.datetime "notesDate", null: false
    t.text     "comments",  null: false
  end

  create_table "tasks", force: true do |t|
    t.string "task", limit: 40, default: "", null: false
  end

  create_table "tasks_frequency", force: true do |t|
    t.integer "taskId",                  null: false
    t.boolean "day",     default: false, null: false
    t.boolean "daypart", default: false, null: false
    t.boolean "active",  default: true,  null: false
  end

  create_table "users", force: true do |t|
    t.string  "name",   limit: 20, default: "",   null: false
    t.boolean "active",            default: true, null: false
  end

end
