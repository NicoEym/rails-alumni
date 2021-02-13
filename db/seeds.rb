require 'date'
require 'faker'
require "open-uri"

User.delete_all


user = User.new(

  firstname:  "Super",
  lastname: "Admin",
  mobile: Faker::PhoneNumber.cell_phone,
  email: "admin@gmail.com",
  avatar_url: "https://i.pravatar.cc/150?img=65",
  admin: true,
  password:  'adminPlage',
  password_confirmation: 'adminPlage',
)

user.save!
puts "Creating admin"


for i in 2..10
  user = User.new(

    firstname:  Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    mobile: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    avatar_url: "https://i.pravatar.cc/150?img=#{i}",
    password:  'valid_password',
    password_confirmation: 'valid_password'
  )
  user.save!

  puts "Creating #{user.firstname} #{user.lastname}"
end

for i in 11..40
  user = User.new(
    firstname:    Faker::Name.first_name ,
    lastname: Faker::Name.last_name,
    mobile: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    avatar_url: "https://i.pravatar.cc/150?img=#{i}",
    password:  'valid_password',
    password_confirmation: 'valid_password'
  )
  user.save!

  puts "Creating #{user.firstname} #{user.lastname}"
end
