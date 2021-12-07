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
user1 = User.create!(email: "marwa@gmail.com", first_name: "Marwa", last_name: "homsi", age: 30, level: "beginner", password: "azerty", url: "marwa1.png", bio: "I like cycling and going out with friends")
user2 = User.create!(email: "yasmine@gmail.com", first_name: "Yasmine", last_name: "Bouhaik", age: 30, level: "intermediate", password: "azerty", url: "yasmine1.png", bio: "I have been cycling since I had legs. Whether in the mountains on the road or with my family, I adapt to the environment!I love meeting people and sharing moments. I've been on the app for a few months and every ride is a real pleasure.")
user3 = User.create!(email: "remi@gmail.com", first_name: "Remi", last_name: "Tondeux", age: 30, level: "advanced", password: "azerty", url: "remi1.png", bio: "I love cycling")
user4 = User.create!(email: "mathieu@gmail.com", first_name: "Mathieu", last_name: "Hollande", age: 30, level: "intermediate", password: "azerty", url: "mathieu1.png", bio: "Turn energy into velocity")


puts "finished"

puts "creating itineraries"
itinerary1 = Itinerary.create!(km: 15, category: "family", description: "happy moments! ride with family", user: user2, title: "Lille-Armentières")
itinerary2 = Itinerary.create!(km: 30, category: "road bike", description: "interesting road bike in the city", user: user2, title: "Mouscron-Lille")
itinerary3 = Itinerary.create!(km: 40, category: "mountain bike", description: "a mountain bike through the mountain! a new bike challenge", user: user2, title: "Phalempin-Lille")
itinerary4 = Itinerary.create!(km: 60, category: "mountain bike", description: "mountain...mountain...everywhere such a pleasure ! ", user: user4, title: "Draucourt-Lille")
itinerary5 = Itinerary.create!(km: 140, category: "road bike", description: "No pain no gain,if you like challenge this is for you", user: user2, title: "Lille-Amiens")
itinerary6 = Itinerary.create!(km: 280, category: "road bike", description: "Fresh air await, Famous mussels and french fries", user: user3, title: "Lomme-Calais")
itinerary7 = Itinerary.create!(km: 320, category: "road bike", description: "I heard you like cycling,we headed straight where bike is born...beautiful Amsterdam", user: user2, title: "Arras-Amsterdam")
itinerary8 = Itinerary.create!(km: 250, category: "road bike", description: "The Tour de France most famous event)", user: user1, title: "Paris-Roubaix")
itinerary9 = Itinerary.create!(km: 490, category: "road bike", description: "Ready for new adventures? I've got something for you...)", user: user2, title: "Rambouillet-Bern")
puts "finished"

puts "creating steps"
step1 = Step.create!(itinerary: itinerary1, address: "16 Rue Jean Jacques Rousseau,59000 Lille")
step2 = Step.create!(itinerary: itinerary1, address: "34-36 Rue du Général Leclerc, 59840 Pérenchies")
step3 = Step.create!(itinerary: itinerary1, address: "4 place du Général-de-Gaulle,Armentiéres")
step1 = Step.create!(itinerary: itinerary5, address: "Lille")
step1 = Step.create!(itinerary: itinerary5, address: "Arras")
step1 = Step.create!(itinerary: itinerary5, address: "Amiens")

puts "finished"

puts "creating rides"
ride1 = { date: DateTime.new(2022,1,15,14.30), itinerary: itinerary1, vote: 0 }
ride2 = { date: DateTime.new(2022,2,20,12), itinerary: itinerary2, vote: 0 }
ride3 = { date: DateTime.new(2022,2,25,10), itinerary: itinerary3, vote: 0 }

[ ride1, ride2, ride3 ].each do |attributes|
    ride = Ride.create!(attributes)
    puts "created #{ride.date}"
end

puts "creating participants"
participant1 = { user: user1, ride: ride1, voted: false  }
participant2 = { user: user1, ride: ride2, voted: false  }
participant3 = { user: user1, ride: ride3, voted: false  }
participant4 = { user: user2, ride: ride1, voted: false  }
participant5 = { user: user2, ride: ride2, voted: false  }
participant6 = { user: user2, ride: ride3, voted: false  }
participant7 = { user: user3, ride: ride1, voted: false  }
participant8 = { user: user3, ride: ride2, voted: false  }
participant9 = { user: user3, ride: ride3, voted: false  }

puts "finished"
