# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# frozen_string_literal: true

require 'faker'

# Clear existing users
User.destroy_all

# Create 10 users with mixed attributes
10.times do |i|
  user = User.create!(
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    postal_code: Faker::Address.zip_code,
    role: ['user', 'admin', 'manager'].sample,
    status: ['active', 'inactive'].sample,
    last_login_at: Faker::Time.between(from: 1.month.ago, to: Time.current)
  )

  puts "Created user: #{user.full_name} (#{user.email})"
end

puts "\nCreated #{User.count} users successfully!"
