User.create!(name: "Stella Njage",
             email: "stellamarisnjage@gmail.com",
             phone_number: "0763864761",
             password: "rainbow",
             password_confirmation: "rainbow",
             admin: true)

49.times do |n|
  name = Faker::Name.name
  email = "stella-#{n+1}@yahoo.com"
  phone_number = Faker::PhoneNumber.phone_number
  password = "password"
  User.create!(name: name,
              email: email,
              phone_number: phone_number,
              password: password,
              password_confirmation: password)
end

