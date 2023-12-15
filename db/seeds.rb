# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "csv"
filepath = "db/migrate/airbnb.csv"

Flat.destroy_all
puts "!!!   START LOADING   !!!"
CSV.foreach(filepath, headers: :first_row) do |row|
  flat = Flat.new(
    name: row['name'],
    address: row['address'],
    description: row['description'],
    price_per_night: row['price'],
    number_of_guests: row['guest']
  )
  flat.save
end
puts "!!!   FINISH   !!!"
