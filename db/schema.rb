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

ActiveRecord::Schema.define(version: 20141015135219) do

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "first"
    t.string   "second"
    t.string   "third"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colors", ["name"], name: "index_colors_on_name", unique: true, using: :btree

  create_table "competence_groups", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",    default: true
    t.integer  "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",    default: false
  end

  add_index "competence_groups", ["color_id"], name: "index_competence_groups_on_color_id", using: :btree

  create_table "competence_knowskills", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.integer  "competence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "competence_knowskills", ["competence_id"], name: "index_competence_knowskills_on_competence_id", using: :btree

  create_table "competence_levels", force: true do |t|
    t.integer  "level"
    t.text     "description"
    t.integer  "points",        default: 0
    t.boolean  "visible",       default: true
    t.integer  "competence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",       default: false
  end

  add_index "competence_levels", ["competence_id"], name: "index_competence_levels_on_competence_id", using: :btree

  create_table "competences", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.text     "description"
    t.boolean  "visible",             default: true
    t.integer  "competence_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",             default: false
  end

  add_index "competences", ["competence_group_id"], name: "index_competences_on_competence_group_id", using: :btree

  create_table "employees", force: true do |t|
    t.string   "fio"
    t.string   "login"
    t.string   "password"
    t.integer  "director_id"
    t.boolean  "fired"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["director_id"], name: "index_employees_on_director_id", using: :btree

end
