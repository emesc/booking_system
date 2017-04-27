require "rails_helper"

RSpec.feature "Signing up a user" do

  # only admin & managers can sign up a user
  before do
    r1 = Role.create!(name: "Admin", description: "Can perform any CRUD operation on any resource")
    r2 = Role.create!(name: "Manager", description: "Can read items. Can create or delete user/teacher accounts")
    r3 = Role.create!(name: "Regular", description: "Can read items")
    @admin = User.create!(first_name: "Admin", last_name: "Doe", email: "admindoe@example.com", password: "foobar", role_id: r1.id)
    @manager = User.create!(first_name: "Manager", last_name: "Doe", email: "managerdoe@example.com", password: "foobar", role_id: r2.id)
    @regular = User.create!(first_name: "Regular", last_name: "Doe", email: "johndoe@example.com", password: "foobar", role_id: r3.id)
    c = Category.create!(name: "Mathematics")
    s1 = SchoolLevel.create!(name: "K-2")
    s2 = SchoolLevel.create!(name: "3-4")
    d = DeliveryMode.create!(name: "Hands on workshop")
    course = Program.create!(program_title: Faker::Lorem.words(2).map(&:capitalize).join(" "), program_description: Faker::Hipster.sentences(10).join(" "), program_fee: 10, image_title: "light fantastic", topics: "energy, reflection, refraction, lenses", duration: 1.5, group_size_min: 10, group_size_max: 20, time_am: "09:30:00", time_pm: "15:30:00", user_id: @admin.id, category_id: c.id, delivery_mode_id: d.id, school_level_ids: [s1.id])
    login_as @admin
  end

  scenario "by an admin with valid credentials" do
    visit "/"
    expect(page).to have_content("Program Booking")
    click_link "Welcome, #{@admin.first_name} #{@admin.last_name}"
    click_link "Admin Area"

    expect(current_path).to eq admin_programs_path
    click_link "Users"
    click_link "Create new"

    expect(current_path).to eq new_admin_user_path
    fill_in "First name", with: "Test"
    fill_in "Last name", with: "User"
    select "Regular", from: "user_role_id"
    fill_in "Email", with: "testuser@example.com"
    fill_in "Password", with: "foobar"
    click_button "Create user"

    expect(current_path).to eq admin_users_path
    expect(page).to have_content("User successfully created")
  end

  scenario "with invalid credentials" do

  end
end