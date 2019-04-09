User.create!(name:  "管理者",
             email: "email@sample.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)

59.times do |n|
  name  = Faker::Name.name
  email = "email#{n+1}@sample.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
               
users = User.order(:created_at).take(6)
50.times do
description = Faker::Lorem.sentence(5)
users.each { |user| user.items.create!(description: description) }
end
end