# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_30_050420) do

  create_table "comments", force: :cascade do |t|
    t.integer "post_id", null: false
    t.text "body"
    t.integer "likes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body"], name: "index_comments_on_body"
    t.index ["likes"], name: "index_comments_on_likes"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.text "body"
    t.integer "status"
    t.boolean "verified"
    t.date "published_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["body"], name: "index_posts_on_body"
    t.index ["published_on"], name: "index_posts_on_published_on"
    t.index ["status"], name: "index_posts_on_status"
    t.index ["title"], name: "index_posts_on_title"
    t.index ["user_id"], name: "index_posts_on_user_id"
    t.index ["verified"], name: "index_posts_on_verified"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "registered_at"
    t.text "preferences"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["latitude"], name: "index_users_on_latitude"
    t.index ["longitude"], name: "index_users_on_longitude"
    t.index ["name"], name: "index_users_on_name"
    t.index ["registered_at"], name: "index_users_on_registered_at"
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "posts", "users"
end
