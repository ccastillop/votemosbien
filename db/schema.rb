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

ActiveRecord::Schema[7.1].define(version: 2024_06_12_223823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "answer_lines", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "option_id", null: false
    t.bigint "question_id", null: false
    t.integer "value_x"
    t.integer "value_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_lines_on_answer_id"
    t.index ["option_id"], name: "index_answer_lines_on_option_id"
    t.index ["question_id"], name: "index_answer_lines_on_question_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "session_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "answerer_type"
    t.bigint "answerer_id"
    t.index ["answerer_type", "answerer_id"], name: "index_answers_on_answerer", unique: true
    t.index ["session_id"], name: "index_answers_on_session_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "dni"
    t.string "names"
    t.string "father_surname"
    t.string "mother_surname"
    t.string "number"
    t.bigint "region_id"
    t.bigint "party_id", null: false
    t.string "status"
    t.bigint "election_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["election_id"], name: "index_candidates_on_election_id"
    t.index ["party_id"], name: "index_candidates_on_party_id"
    t.index ["region_id"], name: "index_candidates_on_region_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "name"
    t.string "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "name"
    t.string "description"
    t.integer "value_x"
    t.integer "value_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "enrollment_date"
    t.string "address"
    t.string "phones", default: [], array: true
    t.string "web"
    t.string "email"
    t.string "agents", default: [], array: true
    t.bigint "user_id"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "password_digest"
    t.string "recover_token"
    t.string "level", default: "no_access"
    t.datetime "email_confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answer_lines", "answers"
  add_foreign_key "answer_lines", "options"
  add_foreign_key "answer_lines", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "candidates", "elections"
  add_foreign_key "candidates", "parties"
  add_foreign_key "candidates", "regions"
  add_foreign_key "candidates", "users"
  add_foreign_key "identities", "users"
  add_foreign_key "options", "questions"
  add_foreign_key "parties", "users"
end
