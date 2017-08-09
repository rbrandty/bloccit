include RandomData

# Create Users
5.times do
  User.create!(
  # #3
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
  name:         RandomData.random_sentence,
  description:  RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
  Post.create!(
  user:   users.sample,
  topic:  topics.sample,
  title:  Faker::Lorem.sentence,
  body:   Faker::Lorem.paragraph
  )
end
posts = Post.all

50.times do
  SponsoredPost.create!(
  topic: topics.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  price: RandomData.random_integer
  )
end
sponsored_posts = SponsoredPost.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
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

admin = User.create!(
name: 'Admin User',
email: 'admin@example.com',
password: 'helloworld',
role: 'admin'
)

moderator = User.create!(
name: 'Moderator User',
email: 'moderator@example.com',
password: 'helloworld',
role: 'moderator'
)

member = User.create!(
name: 'Member User',
email: 'member@example.com',
password: 'helloworld'
)

user = User.first
user.update_attributes!(
email: 'youremail.com', # replace this with your personal email
password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
