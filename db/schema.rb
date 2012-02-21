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

ActiveRecord::Schema.define(:version => 20120214170832) do

  create_table "accomodations", :force => true do |t|
    t.integer   "trip_id"
    t.string    "name"
    t.text      "description"
    t.string    "price1"
    t.string    "price2"
    t.string    "price3"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "categories_trips", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "trip_id"
  end

  create_table "continents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "details_trips", :id => false, :force => true do |t|
    t.integer "detail_id"
    t.integer "trip_id"
  end

  create_table "extras", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.string    "price1"
    t.string    "price2"
    t.string    "price3"
    t.string    "price4"
    t.string    "price5"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "trip_id"
  end

  create_table "images", :force => true do |t|
    t.string    "image_file_name"
    t.string    "image_content_type"
    t.integer   "image_file_size"
    t.timestamp "image_updated_at"
    t.integer   "trip_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "title"
  end

  create_table "lessons", :force => true do |t|
    t.integer   "trip_id"
    t.string    "name"
    t.text      "description"
    t.string    "price1"
    t.string    "price2"
    t.string    "price3"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "country"
    t.integer   "continent_id"
  end

  create_table "packages", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.string    "price1"
    t.string    "price2"
    t.string    "price3"
    t.string    "price4"
    t.string    "price5"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "trip_id"
  end

  create_table "reviews", :force => true do |t|
    t.integer   "trip_id"
    t.text      "content"
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "trips", :force => true do |t|
    t.string   "title"
    t.string   "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.string   "url"
    t.integer  "continent_id"
  end

  create_table "trips_types", :id => false, :force => true do |t|
    t.integer "trip_id"
    t.integer "type_id"
  end

  create_table "types", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "encrypted_password"
    t.string    "salt"
    t.boolean   "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
