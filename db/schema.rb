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

ActiveRecord::Schema.define(version: 20160316132743) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "namespace"
    t.text     "body",          limit: 65535
    t.string   "resource_id",                 null: false
    t.string   "resource_type",               null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "entities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT" do |t|
    t.string  "name",                      default: "",    null: false
    t.string  "legal_name",                default: "",    null: false
    t.text    "legal_other", limit: 65535
    t.text    "address",     limit: 65535
    t.text    "telephone",   limit: 65535
    t.text    "fax",         limit: 65535
    t.text    "email",       limit: 65535
    t.text    "dp_reg",      limit: 65535
    t.text    "dp_contact",  limit: 65535
    t.text    "signatory",   limit: 65535
    t.boolean "is_eea",                    default: false, null: false
    t.text    "country",     limit: 65535,                 null: false
  end

  add_index "entities", ["name"], name: "entityname", unique: true, using: :btree

  create_table "entities_transfers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT" do |t|
    t.integer "entity_id",                    null: false
    t.integer "transfer_id",                  null: false
    t.boolean "is_recipient", default: false, null: false
  end

  add_index "entities_transfers", ["entity_id"], name: "fk_entities_transfers_entities_1", using: :btree
  add_index "entities_transfers", ["transfer_id"], name: "fk_entities_transfers_transfers_1", using: :btree

  create_table "purposes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT" do |t|
    t.string "name",                           default: "", null: false
    t.text   "full_description", limit: 65535,              null: false
    t.text   "data_subjects",    limit: 65535,              null: false
    t.text   "data_categories",  limit: 65535,              null: false
    t.text   "data_recipients",  limit: 65535,              null: false
    t.text   "additional_info",  limit: 65535
    t.text   "storage_limit",    limit: 65535,              null: false
    t.text   "data_sensitive",   limit: 65535,              null: false
    t.text   "security_policy",  limit: 65535,              null: false
  end

  add_index "purposes", ["name"], name: "purposename", unique: true, using: :btree

  create_table "purposes_transfers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT" do |t|
    t.integer "purpose_id",  null: false
    t.integer "transfer_id", null: false
  end

  add_index "purposes_transfers", ["purpose_id"], name: "fk_purposes_transfers_purposes_1", using: :btree
  add_index "purposes_transfers", ["transfer_id"], name: "fk_purposes_transfers_transfers_1", using: :btree

  create_table "transfers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT" do |t|
    t.integer "transfer_type_id"
    t.string  "name"
  end

  add_index "transfers", ["name"], name: "transfername", unique: true, using: :btree
  add_index "transfers", ["transfer_type_id"], name: "fk_transfers_transfertype_1", using: :btree

  create_table "transfertype", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT" do |t|
    t.string "name",          default: "", null: false
    t.string "template_name"
  end

  add_index "transfertype", ["name"], name: "transfertypename", unique: true, using: :btree

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",              default: "", null: false
    t.string   "guid",                            null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "entities_transfers", "entities", name: "fk_entities_transfers_entities_1"
  add_foreign_key "entities_transfers", "transfers", name: "fk_entities_transfers_transfers_1"
  add_foreign_key "purposes_transfers", "purposes", name: "fk_purposes_transfers_purposes_1"
  add_foreign_key "purposes_transfers", "transfers", name: "fk_purposes_transfers_transfers_1"
  add_foreign_key "transfers", "transfertype", column: "transfer_type_id", name: "fk_transfers_transfertype_1"
end
