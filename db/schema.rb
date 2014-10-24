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

ActiveRecord::Schema.define(version: 20141024091334) do

  create_table "authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_authors", force: true do |t|
    t.integer  "book_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.datetime "publication_year"
    t.string   "book_title"
    t.string   "book_edition"
    t.string   "publisher_name"
    t.string   "publisher_city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapter_authors", force: true do |t|
    t.integer  "chapter_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapters", force: true do |t|
    t.datetime "publication_year"
    t.string   "book_name"
    t.string   "book_edition"
    t.string   "chapter_title"
    t.string   "publisher_name"
    t.string   "publisher_city"
    t.string   "page_range_start"
    t.string   "page_range_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journal_authors", force: true do |t|
    t.integer  "journal_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", force: true do |t|
    t.datetime "publication_year"
    t.string   "article_title"
    t.string   "journal_title"
    t.string   "journal_volume"
    t.string   "journal_number"
    t.string   "page_range_start"
    t.string   "page_range_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websites", force: true do |t|
    t.string   "website_title"
    t.datetime "copyright"
    t.string   "article_title"
    t.string   "publication_city"
    t.datetime "date_viewed"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
