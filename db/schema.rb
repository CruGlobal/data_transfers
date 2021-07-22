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

ActiveRecord::Schema.define(version: 2016_03_16_132743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "countries", id: false, force: :cascade do |t|
    t.string "country", limit: 65535
    t.string "code", limit: 65535
    t.string "lat", limit: 65535
    t.string "lon", limit: 65535
  end

  create_table "entities", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "legal_name", limit: 255, null: false
    t.string "legal_other", limit: 65535
    t.string "address", limit: 65535
    t.string "telephone", limit: 65535
    t.string "fax", limit: 65535
    t.string "email", limit: 65535
    t.string "dp_reg", limit: 65535
    t.string "dp_contact", limit: 65535
    t.string "signatory", limit: 65535
    t.integer "is_eea", limit: 2, null: false
    t.string "country", limit: 65535, null: false
    t.string "area", limit: 65535
    t.integer "is_areaoffice", limit: 2, null: false
    t.string "description", limit: 65535
  end

  create_table "entity_transfers", id: :integer, default: nil, force: :cascade do |t|
    t.integer "entity_id", null: false
    t.integer "transfer_id", null: false
    t.integer "is_recipient", limit: 2, null: false
  end

  create_table "purpose_transfers", id: :integer, default: nil, force: :cascade do |t|
    t.integer "purpose_id", null: false
    t.integer "transfer_id", null: false
  end

  create_table "purposes", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "full_description", limit: 65535, null: false
    t.string "data_subjects", limit: 65535, null: false
    t.string "data_categories", limit: 65535, null: false
    t.string "data_recipients", limit: 65535, null: false
    t.string "additional_info", limit: 65535
    t.string "storage_limit", limit: 65535, null: false
    t.string "data_sensitive", limit: 65535, null: false
    t.string "security_policy", limit: 65535, null: false
    t.string "context", limit: 65535
  end

  create_table "transfer_types", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "template_name", limit: 255
    t.string "context", limit: 255
  end

  create_table "transfers", id: :integer, default: nil, force: :cascade do |t|
    t.integer "transfer_type_id"
    t.string "name", limit: 255
  end

  create_table "users", id: :integer, default: nil, force: :cascade do |t|
    t.string "username", limit: 255, null: false
    t.string "sso_guid", limit: 255, null: false
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.integer "sign_in_count", null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
