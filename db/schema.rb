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

ActiveRecord::Schema.define(version: 20170302001812) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_modes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "program_title"
    t.string   "program_description"
    t.decimal  "program_fee",         precision: 5, scale: 2
    t.string   "image_title"
    t.string   "topics"
    t.integer  "group_size_min"
    t.integer  "group_size_max"
    t.time     "time_am"
    t.time     "time_pm"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "delivery_mode_id"
    t.integer  "school_level_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["category_id"], name: "index_programs_on_category_id", using: :btree
    t.index ["delivery_mode_id"], name: "index_programs_on_delivery_mode_id", using: :btree
    t.index ["school_level_id"], name: "index_programs_on_school_level_id", using: :btree
    t.index ["user_id"], name: "index_programs_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "school_levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "programs", "categories"
  add_foreign_key "programs", "delivery_modes"
  add_foreign_key "programs", "school_levels"
  add_foreign_key "programs", "users"
  add_foreign_key "users", "roles"
end