# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100320225941) do

  create_table "clients", :force => true do |t|
    t.string   "nombre"
    t.string   "address"
    t.string   "rfc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_name"
  end

  create_table "invoice_headers", :force => true do |t|
    t.string   "folio"
    t.date     "date"
    t.boolean  "paid"
    t.integer  "payment_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
  end

end
