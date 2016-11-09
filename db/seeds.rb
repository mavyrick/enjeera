# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 25.times do
#   Company.create(title: Faker::Company.name, tag_line: Faker::Company.catch_phrase, description: Faker::Lorem.paragraphs)
# end

25.times do
  User.create!(company_admin: false, email: Faker::Internet.email, password: '12345', password_digest: '12345', user_name: Faker::Internet.user_name, first_name: 'John', last_name: 'Doe', tagline: Faker::Lorem.sentence, summary: Faker::Lorem.paragraphs)
end
