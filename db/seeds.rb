50.times do |n|
  name = "name"
  email = "email"
  password = "password"
  image_name = "image_name"
  User.create!(name: name, email: email, password: password, image_name: image_name,)
end