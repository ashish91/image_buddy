# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Post.destroy_all
Tag.destroy_all

admin = User.create!(email: 'admin@imagebuddy.com', password: 'password123')
moderator = User.create!(email: 'moderator@imagebuddy.com', password: 'password123')
user = User.create!(email: 'user@imagebuddy.com', password: 'password123')

25.times do
  Post.create!(
    title: Faker::Lorem.words(number: (1..5).to_a.sample).join(" "),
    body: Faker::Lorem.sentence(word_count: (10..25).to_a.sample),
    user: [admin, moderator, user].sample
  )
end

[:funny, :nature, :art, :anime, :cute].each do |name|
  Tag.create!(
    name: name
  )
end

Post.all.each do |post|
  count = (1..5).to_a.sample
  tags = Tag.order("RANDOM()").limit(count)

  post.tags << tags
end
