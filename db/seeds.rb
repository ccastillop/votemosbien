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

puts "populating questions and options"
File.open( Rails.root.join('db', 'data', 'preguntas.txt') , "r").each_slice(5).with_index do |batch, idx1|
  question = Question.create!(name: batch[0], description: batch[1])
  puts question.name
  batch[2..4].each.with_index do |option, idx2|
    print "-#{idx1}:#{idx2}-"
    question.options.create!(
      name: option,
      value_x: idx1 < 10 ? idx2 : 0,
      value_y: idx1 < 10 ? 0 : idx2
    )
  end
  puts " "
end
