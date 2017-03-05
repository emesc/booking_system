# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# school level
SchoolLevel.create!(name: "K-2")
(1..9).reject{ |x| x.even? }.collect do |x|
  name = "#{x+2}-#{x+3}"
  SchoolLevel.create!(name: name)
  x += 1
end
SchoolLevel.create!(name: "VCE")

# delivery modes
DeliveryMode.create!(name: "Hands on workshop")
DeliveryMode.create!(name: "Lecture Demonstration")
DeliveryMode.create!(name: "Self-guided")

# roles
r1 = Role.create!(name: "Admin", description: "Can perform any CRUD operation on any resource")
# manager can make/edit bookings
r2 = Role.create!(name: "Manager", description: "Can read items. Can create or delete user/teacher accounts")
# regular can make/edit bookings
r3 = Role.create!(name: "Regular", description: "Can read items")

# categories
Category.create!(name: "Mathematics")
Category.create!(name: "Physical Science")
Category.create!(name: "Nature Science")
Category.create!(name: "Kitchen Science")
Category.create!(name: "Sports Science")
Category.create!(name: "Technology")
Category.create!(name: "Arts")
Category.create!(name: "Humanities")
Category.create!(name: "English")

# users
User.create!(first_name: "Dan", last_name: "Smith", email: "dansmith@example.com", role_id: r1.id)
User.create!(first_name: "Beth", last_name: "Troy", email: "bethtroy@example.com", role_id: r1.id)
User.create!(first_name: "Kyle", last_name: "Simon", email: "kylesimon@example.com", role_id: r1.id)
User.create!(first_name: "John", last_name: "King", email: "johnking@example.com", role_id: r2.id)
User.create!(first_name: "Abie", last_name: "Mills", email: "abiemills@example.com", role_id: r2.id)
User.create!(first_name: "Faye", last_name: "Little", email: "fayelittle@example.com", role_id: r2.id)

50.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  User.create!(first_name: first_name, last_name: last_name, email: email, role_id: r3.id)
end

# programs
Program.create!(program_title: Faker::Lorem.words(2).map(&:capitalize).join(" "), program_description: Faker::Hipster.sentences(10).join(" "), program_fee: 10, image_title: "light fantastic", topics: "energy, reflection, refraction, lenses", duration: 1.5, group_size_min: 10, group_size_max: 20, time_am: "09:30:00", time_pm: "14:30:00", user_id: 1, category_id: 1, delivery_mode_id: 1, school_level_ids: [5])
Program.create!(program_title: Faker::Lorem.words(3).map(&:capitalize).join(" "), program_description: Faker::Hipster.sentences(10).join(" "), program_fee: 0, image_title: "airplane", topics: "energy, forces", duration: 1, group_size_min: 10, group_size_max: 20, time_am: "09:30:00", time_pm: "14:30:00", user_id: 2, category_id: 2, delivery_mode_id: 1, school_level_ids: [6])
Program.create!(program_title: Faker::Lorem.words(2).map(&:capitalize).join(" "), program_description: Faker::Hipster.sentences(10).join(" "), program_fee: 0, image_title: "pressure build up", topics: "energy, atmospheric pressure, surface area", duration: 1, group_size_min: 10, group_size_max: 50, time_am: "09:30:00", time_pm: "14:30:00", user_id: 3, category_id: 2, delivery_mode_id: 2, school_level_ids: [3, 4])
