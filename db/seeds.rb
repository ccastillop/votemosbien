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

puts "populating parties, elections and candidates"
require 'csv'    
csv_text = File.read(Rails.root.join('db', 'data', 'candidatos.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  print "c"
  row = row.to_h.transform_values{|v| v.split(" ").map(&:capitalize).join(" ") rescue nil }
  election = Election.find_or_create_by name: row.delete("election")
  region = Region.find_or_create_by name: row.delete("region") rescue nil
  party = Party.find_or_create_by name: row.delete("party")
  dni = "%08d" % row.delete("dni")
  attributes = {
    party: party,
    region: region,
    election: election,
    dni: dni
  }.merge(row)
  candidate = Candidate.create! attributes
end
puts "Fin candidatos"

Party.import 
