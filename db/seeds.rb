# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
User.destroy_all
Itinerary.destroy_all
Ride.destroy_all

puts "creating users"
user1 = User.create!(email: "marwa@gmail.com", first_name: "Marwa", last_name: "homsi", age: 30, level: "beginner", password: "azerty", url: "user1.png") 
user2 = User.create!(email: "yasmine@gmail.com", first_name: "Yasmine", last_name: "Bouhaik", age: 30, level: "intermediate", password: "azerty", url: "user2.png")
user3 = User.create!(email: "remi@gmail.com", first_name: "remi", last_name: "Tondeux", age: 30, level: "advanced", password: "azerty", url: "user3.png")


puts "finished"

puts "creating itineraries"
itinerary1 = Itinerary.create!(km: 15, category: "family", description: "happy moments! ride with family", user: user1, title: "bike with family")
itinerary2 = Itinerary.create!(km: 30, category: "road bike", description: "interesting road bike in the city", user: user2, title: "road bike")
itinerary3 = Itinerary.create!(km: 40, category: "mountain bike", description: "a mountain bike through the mountain! a new bike challenge", user: user3, title: "mountain bike")

puts "finished"

puts "creating rides"
ride1 = { date: DateTime.new(2022,1,15,14.30), itinerary: itinerary1 }
ride2 = { date: DateTime.new(2022,2,20,12), itinerary: itinerary2 }
ride3 = { date: DateTime.new(2022,2,25,10), itinerary: itinerary3 }

[ ride1, ride2, ride3 ].each do |attributes|
    ride = Ride.create!(attributes)
    puts "created #{ride.date}"
end
puts "finished"