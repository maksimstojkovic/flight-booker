# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Airports
a1 = Airport.find_or_create_by!(name: "Belgrad (Beograd) - Belgrade Nikola Tesla International, Serbia", code: "BEG")
a2 = Airport.find_or_create_by!(name: "London - Gatwick, United Kingdom", code: "LGW")
a3 = Airport.find_or_create_by!(name: "Los Angeles (CA) - International, USA", code: "LAX")
a4 = Airport.find_or_create_by!(name: "Shanghai - Pu Dong, China", code: "PVG")
a5 = Airport.find_or_create_by!(name: "Sydney - Sydney Airport, Australia", code: "SYD")

# Flights
f1 = Flight.find_or_create_by!(departure_airport: a1, arrival_airport: a2, date: DateTime.new(2024,1,1,6), duration: 60)
f2 = Flight.find_or_create_by!(departure_airport: a2, arrival_airport: a3, date: DateTime.new(2024,1,2,6), duration: 60)
f3 = Flight.find_or_create_by!(departure_airport: a3, arrival_airport: a4, date: DateTime.new(2024,1,3,6), duration: 60)
f4 = Flight.find_or_create_by!(departure_airport: a4, arrival_airport: a5, date: DateTime.new(2024,1,4,6), duration: 60)
f5 = Flight.find_or_create_by!(departure_airport: a5, arrival_airport: a1, date: DateTime.new(2024,1,5,6), duration: 60)
