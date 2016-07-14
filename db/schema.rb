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

ActiveRecord::Schema.define(version: 20160714095551) do

  create_table "administrators", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_categories", force: :cascade do |t|
    t.integer  "talent_id"
    t.string   "name"
    t.boolean  "display_flg"
    t.integer  "sort"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "talent_id"
    t.integer  "job_category_id"
    t.string   "title"
    t.string   "cast"
    t.boolean  "bold_flg"
    t.boolean  "subtitle_flg"
    t.boolean  "display_flg"
    t.integer  "sort"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "talents", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "name_kana"
    t.string   "name_eng"
    t.integer  "category_id"
    t.integer  "birth_month"
    t.integer  "birth_day"
    t.integer  "prefecture_id"
    t.string   "hometown"
    t.text     "hobby"
    t.string   "url_hp"
    t.string   "url_blog"
    t.string   "url_tw"
    t.string   "url_fb"
    t.string   "url_ins"
    t.text     "masterpiece"
    t.string   "voice_mix"
    t.string   "voice_line_1"
    t.string   "voice_line_2"
    t.string   "voice_line_3"
    t.string   "voice_line_4"
    t.string   "voice_narration_1"
    t.string   "voice_narration_2"
    t.string   "voice_narration_3"
    t.string   "voice_narration_4"
    t.string   "voice_talk_1"
    t.string   "voice_talk_2"
    t.string   "voice_talk_3"
    t.string   "voice_talk_4"
    t.string   "voice_other_1"
    t.string   "voice_other_2"
    t.string   "voice_other_3"
    t.string   "voice_other_4"
    t.boolean  "display_flg"
    t.datetime "deleted"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "image1_file_name"
    t.string   "image1_content_type"
    t.integer  "image1_file_size"
    t.datetime "image1_updated_at"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

end
