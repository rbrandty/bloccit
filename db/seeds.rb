# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include RandomData

puts "Seeding Topics, Posts, Sponsored Posts, Comments, Advertisements, Questions"

# Create Topics
15.times do
  Topic.create!(
  name:         RandomData.random_sentence,
  description:  RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  Post.create!(
  topic:  topics.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

#post = Post.find_or_create_by( title: 'This is a unique post', body: 'It will only be created once' );
#Comment.find_or_create_by( post: post, body: 'This is a unique comment' )
# Create Sponsored Posts
5.times do
  SponsoredPost.create!(
  topic:  topics.sample,
  title:  RandomData.random_sentence,
  body:   RandomData.random_paragraph
  )
end

50.times do
  Advertisement.create!(
  title: RandomData.random_sentence,
  copy: RandomData.random_paragraph,
  price: RandomData.random_integer
  )
end

50.times do
  Question.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  resolved: RandomData.random_boolean
  )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
