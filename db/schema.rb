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

ActiveRecord::Schema.define(version: 2021_03_20_153705) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer "requestor_id"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "friend_a_id"
    t.integer "friend_b_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "group_name"
    t.string "admin_name"
    t.string "photo"
    t.string "cover_photo"
    t.integer "admin_id"
    t.boolean "privacy"
    t.string "description"
    t.boolean "visibility"
    t.string "city"
    t.string "country"
    t.string "group_rules"
  end

  create_table "page_followers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "page_name"
    t.string "sub_title"
    t.string "page_email"
    t.integer "page_phone_no"
    t.string "page_city"
    t.string "page_country"
    t.string "page_description"
    t.string "page_facebook"
    t.string "page_twitter"
    t.string "page_google_plus"
    t.string "page_instagram"
    t.string "admin_name"
    t.integer "admin_id"
    t.string "photo"
    t.string "cover_photo"
    t.boolean "privacy"
    t.boolean "visibility"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "likes"
    t.integer "dislikes"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photos"
    t.string "videos"
    t.integer "group_id"
    t.integer "page_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.string "email"
    t.string "phone_no"
    t.integer "Dob_day"
    t.string "Dob_month"
    t.integer "Dob_year"
    t.string "gender"
    t.string "city"
    t.string "country"
    t.string "about_me"
    t.string "university"
    t.string "qualification"
    t.string "university_start"
    t.string "university_end"
    t.string "university_city"
    t.string "university_country"
    t.string "profession"
    t.string "workplace"
    t.string "workplace_city"
    t.string "workplace_country"
    t.string "interests"
    t.string "skills"
    t.string "languages"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "profile_photo"
    t.string "cover_photo"
    t.string "photo"
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_reactions_on_post_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "room_messages", force: :cascade do |t|
    t.integer "room_id", null: false
    t.integer "user_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_room_messages_on_room_id"
    t.index ["user_id"], name: "index_room_messages_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "first_person_id"
    t.integer "second_person_id"
    t.index ["name"], name: "index_rooms_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "reactions", "posts"
  add_foreign_key "reactions", "users"
  add_foreign_key "room_messages", "rooms"
  add_foreign_key "room_messages", "users"
end
