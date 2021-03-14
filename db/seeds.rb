# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating admin"
User.create!(
  first_name: "cristiam",
  last_name: "castillo",
  email: "ccastillop@gmail.com",
  password:  "lima1234",
  password_confirmation: "lima1234", 
  level: "admin" 
)