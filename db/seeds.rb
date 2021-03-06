User.create!(name: "Stella Njage",
             email: "stellamarisnjage@gmail.com",
             phone_number: "0710864761",
             password: "rainbow",
             password_confirmation: "rainbow",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

49.times do |n|
  name = Faker::Name.name
  email = "stella-#{n+1}@yahoo.com"
  phone_number = Faker::PhoneNumber.phone_number
  password = "password"
  User.create!(name: name,
              email: email,
              phone_number: phone_number,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

users = User.order(:created_at).take(6)
10.times do
  learnt = Faker::Lorem.sentence
  problem = Faker::Lorem.sentence
  possible_fix = Faker::Lorem.sentence
  users.each { |user| user.feedbacks.create!(learnt: learnt, problem: problem, possible_fix: possible_fix) }
end

