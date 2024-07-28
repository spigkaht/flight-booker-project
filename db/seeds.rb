# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Clearing out your junk.."
Flight.destroy_all
Airport.destroy_all
puts "All clean!"

10.times do |i|
  Airport.create!(code: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'))
  puts "Created airport ##{i}"
end
puts "All airports created"

airports = Airport.all
ltrs = ("A".."Z").to_a
nums = (0..9).to_a

500.times do |i|
  Flight.create!(
    departure_airport: airports.sample,
    arrival_airport: airports.sample,
    flight_number: "#{ltrs.sample}#{ltrs.sample}#{nums.sample}#{nums.sample}#{nums.sample}",
    start_datetime: Faker::Date.forward(days: 23),
    flight_duration: (60..3600).to_a.sample
    )
  puts "Created flight ##{i}"
end
puts "All flights created"

puts "All done!"
