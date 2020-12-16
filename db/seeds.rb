require 'csv'

# Clear data from tables
Transaction.delete_all
InvoiceItem.delete_all
Invoice.delete_all
Item.delete_all
Customer.delete_all
Merchant.delete_all

# Reset the primary key sequences on all tables:
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# Import seed data from pgdump file:
cmd = "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d rails_engine_development db/data/rails-engine-development.pgdump"
puts "Loading PostgreSQL Data dump into local database with command:"
puts cmd
system(cmd)

# Import the CSV data into the Items table:
items_csv = './db/data/items.csv'
CSV.foreach(items_csv, { headers: true, header_converters: :symbol }) do |item|
  unit_price = item[:unit_price].to_f / 100

  Item.create!(
    id: item[:id].to_i,
    name: item[:name],
    description: item[:description],
    unit_price: unit_price,
    merchant_id: item[:merchant_id].to_i,
    created_at: item[:created_at],
    updated_at: item[:updated_at]
  )
end
