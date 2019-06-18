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

ActiveRecord::Schema.define(version: 20190618025512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "schools", force: :cascade do |t|
    t.string   "school_code"
    t.string   "school_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "student_performances", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "grade"
    t.string   "school_year"
    t.string   "subject"
    t.integer  "semester"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "score"
    t.index ["student_id"], name: "index_student_performances_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "sex",           null: false
    t.date     "date_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "student_id"
    t.integer  "school_id"
    t.index ["school_id"], name: "index_students_on_school_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "student_performances", "students"
  add_foreign_key "students", "schools"
end
