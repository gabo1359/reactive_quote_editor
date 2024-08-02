# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Development seeds
# puts "\n== Seeding the database with fixtures =="
# system("bin/rails db:fixtures:load")

# Production seeds
puts "\n== Seeding the database =="

kpmg = Company.create(name: "KPMG")
pwc = Company.create(name: "PWC")

User.create(company: kpmg, email: "accountant@kpmg.com", password: "password")
User.create(company: kpmg, email: "manager@kpmg.com", password: "password")
User.create(company: pwc, email: "eavesdropper@pwc.com", password: "password")

first_quote = Quote.create(company: kpmg, name: "First quote")
Quote.create(company: kpmg, name: "Second quote")
Quote.create(company: kpmg, name: "Third quote")

today = LineItemDate.create(quote: first_quote, date: Date.current)
next_week = LineItemDate.create(quote: first_quote, date: Date.current + 1.week)

LineItem.create(line_item_date: today, name: "Meeting room", description: "A cosy meeting room for 10 people", quantity: 1, unit_price: 1000)
LineItem.create(line_item_date: today, name: "Meal tray", description: "Our delicious meal tray", quantity: 10, unit_price: 25)
LineItem.create(line_item_date: next_week, name: "Meeting room", description: "A cosy meeting room for 10 people", quantity: 1, unit_price: 1000)
LineItem.create(line_item_date: next_week, name: "Meal tray", description: "Our delicious meal tray", quantity: 10, unit_price: 25)

puts "\n== Database fulfilled =="
