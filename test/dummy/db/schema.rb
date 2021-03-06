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

ActiveRecord::Schema.define(version: 20150213015850) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "proclaim_comment_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "proclaim_comment_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_udx", unique: true
  add_index "proclaim_comment_hierarchies", ["descendant_id"], name: "comment_desc_idx"

  create_table "proclaim_comments", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "parent_id"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "proclaim_comments", ["post_id"], name: "index_proclaim_comments_on_post_id"

  create_table "proclaim_images", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "proclaim_images", ["post_id"], name: "index_proclaim_images_on_post_id"

  create_table "proclaim_posts", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title",        default: "",      null: false
    t.text     "body",         default: "",      null: false
    t.string   "state",        default: "draft", null: false
    t.datetime "published_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "slug"
  end

  add_index "proclaim_posts", ["author_id"], name: "index_proclaim_posts_on_author_id"
  add_index "proclaim_posts", ["slug"], name: "index_proclaim_posts_on_slug", unique: true
  add_index "proclaim_posts", ["state"], name: "index_proclaim_posts_on_state"

  create_table "proclaim_subscriptions", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "email"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name",       default: "", null: false
  end

  add_index "proclaim_subscriptions", ["post_id", "email"], name: "index_proclaim_subscriptions_on_post_id_and_email", unique: true
  add_index "proclaim_subscriptions", ["post_id"], name: "index_proclaim_subscriptions_on_post_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
