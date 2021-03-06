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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110702123805) do

  create_table "answers", :force => true do |t|
    t.integer  "loeb_id"
    t.integer  "post_id"
    t.integer  "team_id"
    t.integer  "no_of_answers"
    t.text     "answers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "loebs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact"
    t.datetime "start"
    t.datetime "slut"
    t.string   "custom_id"
    t.boolean  "create_teams"
  end

  create_table "posts", :force => true do |t|
    t.text     "description"
    t.text     "rigtig_svar"
    t.string   "rigtig_svar_ans"
    t.text     "forkert_svar"
    t.boolean  "try_again"
    t.integer  "loeb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",            :default => "Navn"
    t.string   "placement"
    t.string   "post_type"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "code"
    t.text     "team_members"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "loeb_id"
  end

end
