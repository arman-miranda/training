# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..50).each do |i|
  #Create Departments
  name = Faker::Commerce.department
  Department.create(name: name)

  departments = Department.all

  # Create Users
  username   = Faker::Name.unique.name
  password   = Faker::Ancient.god + ((1..1000).to_a).sample.to_s
  first_name = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  email      = Faker::Internet.free_email("#{first_name} #{last_name}")
  position   = Faker::Name.title
  department_id = departments[rand(departments.length)][:id]

  User.create!(username: username, first_name: first_name, last_name: last_name, email: email, position: position, department_id: department_id, password: password)

  users = User.all

  #Create content
   content = Faker::HarryPotter.quote
   user_id = users[rand(users.length)][:id]
   Post.create(user_id: user_id, post: content)
end
