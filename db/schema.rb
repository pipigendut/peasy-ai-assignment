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

ActiveRecord::Schema[7.1].define(version: 2024_05_02_005425) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_records", force: :cascade do |t|
    t.date "date"
    t.integer "male_count"
    t.integer "female_count"
    t.integer "male_avg_age"
    t.integer "female_avg_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_daily_records_on_date", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "gender"
    t.jsonb "name"
    t.jsonb "location"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", using: :gin
  end

end
