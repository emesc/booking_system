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
u1 = User.new(first_name: "Dan", last_name: "Smith", email: "dansmith@example.com", password: "foobar", password_confirmation: "foobar", role_id: r1.id)
u1.creator_id = 1
u1.save
User.create!(first_name: "Beth", last_name: "Troy", email: "bethtroy@example.com", password: "foobar", password_confirmation: "foobar", role_id: r1.id, creator_id: u1.id)
User.create!(first_name: "Kyle", last_name: "Simon", email: "kylesimon@example.com", password: "foobar", password_confirmation: "foobar", role_id: r1.id, creator_id: u1.id)
User.create!(first_name: "John", last_name: "King", email: "johnking@example.com", password: "foobar", password_confirmation: "foobar", role_id: r2.id, creator_id: u1.id)
User.create!(first_name: "Abie", last_name: "Mills", email: "abiemills@example.com", password: "foobar", password_confirmation: "foobar", role_id: r2.id, creator_id: u1.id)
User.create!(first_name: "Faye", last_name: "Little", email: "fayelittle@example.com", password: "foobar", password_confirmation: "foobar", role_id: r2.id, creator_id: u1.id)


50.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = first_name.downcase + last_name.downcase + "@" + Faker::Internet.email.split("@").last
  User.create!(first_name: first_name, last_name: last_name, email: email, password: "foobar", password_confirmation: "foobar", role_id: r3.id, creator_id: u1.id)
end

# programs
Program.create!(program_title: Faker::Lorem.words(2).map(&:capitalize).join(" "), program_description: Faker::Hipster.sentences(10).join(" "), program_fee: 10, image_title: "light fantastic", topics: "energy, reflection, refraction, lenses", duration: 1.5, group_size_min: 10, group_size_max: 20, time_am: "09:30:00", time_pm: "14:30:00", user_id: 1, category_id: 1, delivery_mode_id: 1, school_level_ids: [5])
Program.create!(program_title: Faker::Lorem.words(3).map(&:capitalize).join(" "), program_description: Faker::Hipster.sentences(10).join(" "), program_fee: 0, image_title: "airplane", topics: "energy, forces", duration: 1, group_size_min: 10, group_size_max: 20, time_am: "09:30:00", time_pm: "14:30:00", user_id: 2, category_id: 2, delivery_mode_id: 1, school_level_ids: [6])
Program.create!(program_title: Faker::Lorem.words(2).map(&:capitalize).join(" "), program_description: Faker::Hipster.sentences(10).join(" "), program_fee: 0, image_title: "pressure build up", topics: "energy, atmospheric pressure, surface area", duration: 1, group_size_min: 10, group_size_max: 50, time_am: "09:30:00", time_pm: "14:30:00", user_id: 3, category_id: 2, delivery_mode_id: 2, school_level_ids: [3, 4])

30.times do |n|
  program_title = Faker::Lorem.words(2).map(&:capitalize).join(" ")
  program_description = Faker::Hipster.sentences(10).join(" ")
  # round to the nearest 50c
  temp_fee = ((rand(1..5.0) * 2).round(0)) / 2.0
  program_fee = temp_fee <= 1 ? 0 : temp_fee
  # image_url = Rails.root.join("app/assets/images/science").open
  image_url = File.open(File.join(Rails.root, "app/assets/images/science/#{rand(1..11)}.jpg"))
  image_title = Faker::Lorem.words(2).join(" ")
  topics = Faker::Lorem.words(rand(2..4)).join(", ")
  duration = ((rand(1..3.0) * 2).round(0)) / 2.0
  group_size_min = 10
  group_size_max = rand(20..50).round(-1)
  time_am = "09:30:00"
  time_pm = "14:30:00"
  user_id = rand(1..3)
  category_id = rand(1..9)
  delivery_mode_id = rand(1..3)
  # generate random array of consecutive elements for target audience
  x = rand(0..4)
  school_level_ids = (1..7).to_a[x..(x+(rand(1..2)))]
  Program.create!(program_title: program_title, program_description: program_description, program_fee: program_fee, image: image_url, image_title: image_title, topics: topics, duration: duration, group_size_min: group_size_min, group_size_max: group_size_max, time_am: time_am, time_pm: time_pm, user_id: user_id, category_id: category_id, delivery_mode_id: delivery_mode_id, school_level_ids: school_level_ids)
end
