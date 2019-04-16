# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  user = User.create!(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password(10))
  user.articles.create!(title: Faker::Lorem.sentence, body: Faker::Markdown.emphasis, status: Faker::Number.between(0, 2), like_count: Faker::Number.between(0, 20))
end

10.times do
  Tag.create!(name: Faker::ProgrammingLanguage.name)
end
