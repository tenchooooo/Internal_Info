# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_19_014116) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "checks", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_checks_on_member_id"
    t.index ["post_id"], name: "index_checks_on_post_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment_content"
    t.integer "member_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_comments_on_member_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "telephone_number", null: false
    t.string "department", null: false
    t.boolean "is_approval", default: false, null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id", "tag_id"], name: "index_post_tags_on_post_id_and_tag_id", unique: true
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "subject", null: false
    t.text "text", null: false
    t.string "check_count"
    t.datetime "limit"
    t.integer "browse_status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.date "day", null: false
    t.string "time"
    t.integer "member_id", null: false
    t.integer "attendance"
    t.string "trip"
    t.string "go_out"
    t.string "other"
    t.datetime "start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.string "tag_status", default: "0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "checks", "members"
  add_foreign_key "checks", "posts"
  add_foreign_key "comments", "members"
  add_foreign_key "comments", "posts"
  add_foreign_key "post_tags", "posts"
  add_foreign_key "post_tags", "tags"
end
