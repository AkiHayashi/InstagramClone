50.times do |n|
  name = Faker::name
  email = Faker::Internet.email
  password = "password"
  image_name = "image_name"
  User.create!(name: name, email: email, password: password, image_name: image_name,)
end