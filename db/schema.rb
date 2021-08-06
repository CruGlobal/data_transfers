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

  create_table "countries", id: false, comment: "From https://www.worlddata.info/downloads/", force: :cascade do |t|
    t.text "country"
    t.text "code"
    t.text "lat"
    t.text "lon"
  end

  create_table "entities", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "legal_name", default: "", null: false
    t.text "legal_other"
    t.text "address"
    t.text "telephone"
    t.text "fax"
    t.text "email"
    t.text "dp_reg"
    t.text "dp_contact"
    t.text "signatory"
    t.boolean "is_eea", default: false, null: false
    t.text "country", null: false
    t.text "area"
    t.boolean "is_areaoffice", default: false, null: false
    t.text "description"
    t.index ["name"], name: "entityname", unique: true
  end

  create_table "entity_transfers", force: :cascade do |t|
    t.integer "entity_id", null: false
    t.integer "transfer_id", null: false
    t.boolean "is_recipient", default: false, null: false
    t.index ["entity_id"], name: "fk_entities_transfers_entities_1"
    t.index ["transfer_id"], name: "fk_entities_transfers_transfers_1"
  end

  create_table "purpose_transfers", force: :cascade do |t|
    t.integer "purpose_id", null: false
    t.integer "transfer_id", null: false
    t.index ["purpose_id"], name: "fk_purposes_transfers_purposes_1"
    t.index ["transfer_id"], name: "fk_purposes_transfers_transfers_1"
  end

  create_table "purposes", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "full_description", null: false
    t.text "data_subjects", null: false
    t.text "data_categories", null: false
    t.text "data_recipients", null: false
    t.text "additional_info"
    t.text "storage_limit", null: false
    t.text "data_sensitive", null: false
    t.text "security_policy", null: false
    t.text "context"
    t.index ["name"], name: "purposename", unique: true
  end

  create_table "transfer_types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "template_name"
    t.text "context"
    t.index ["name"], name: "transfertypename", unique: true
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "transfer_type_id"
    t.string "name"
    t.index ["name"], name: "transfername", unique: true
    t.index ["transfer_type_id"], name: "fk_transfers_transfertype_1"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "sso_guid", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "entity_transfers", "entities", name: "fk_entities_transfers_entities_1"
  add_foreign_key "entity_transfers", "transfers", name: "fk_entities_transfers_transfers_1"
  add_foreign_key "purpose_transfers", "purposes", name: "fk_purposes_transfers_purposes_1"
  add_foreign_key "purpose_transfers", "transfers", name: "fk_purposes_transfers_transfers_1"
  add_foreign_key "transfers", "transfer_types", name: "fk_transfers_transfertype_1"
end
