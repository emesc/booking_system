require "rails_helper"

RSpec.feature "Creating a program" do

  before do
    r1 = Role.create!(name: "Admin", description: "Can perform any CRUD operation on any resource")
    @user = User.create!(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "foobar", role_id: r1.id)
    login_as @user
    @c = Category.create!(name: "Mathematics")
    @s1 = SchoolLevel.create!(name: "K-2")
    @s2 = SchoolLevel.create!(name: "3-4")
    @d = DeliveryMode.create!(name: "Hands on workshop")
    @course = Program.create!(program_title: Faker::Lorem.words(2).map(&:capitalize).join(" "), program_description: Faker::Hipster.sentences(10).join(" "), program_fee: 10, image_title: "light fantastic", topics: "energy, reflection, refraction, lenses", duration: 1.5, group_size_min: 10, group_size_max: 20, time_am: "09:30:00", time_pm: "15:30:00", user_id: @user.id, category_id: @c.id, delivery_mode_id: @d.id, school_level_ids: [@s1.id])
  end

  scenario "A logged in admin creates a new program" do
    visit "/"
    click_link "Welcome, #{@user.first_name} #{@user.last_name}"
    click_link "Admin Area"

    expect(current_path).to eq admin_programs_path
    click_link "Create new"

    expect(current_path).to eq new_admin_program_path
    fill_in "Title", with: "Sample title"
    fill_in "Description", with: "Sample description"
    fill_in "Cost per student (AUD)", with: 10
    fill_in "Topics", with: "Sample topic"
    fill_in "Min group size", with: 20
    fill_in "Max group size", with: 40
    fill_in "Duration (hrs)", with: 1.5
    fill_in "AM time", with: "09:30 AM"
    fill_in "PM time", with: "03:00 PM"
    select "#{@c.name}", from: "categories"
    select "#{@d.name}", from: "deliveries"
    check("school_level_id_#{@s1.id}")
    check("school_level_id_#{@s2.id}")
    expect(Program.last.user).to eq @user
    click_button "Create program"

    expect(page).to have_content("Program successfully created")
    expect(page).to have_content("SAMPLE TITLE")
    expect(page).to have_content("Start times: 9:30 AM, 3:00 PM")
    expect(page).to have_content("Mode of delivery: #{@d.name}")
    expect(page).to have_content("Target audience: #{@s1.name}, #{@s2.name}")
    expect(page).to have_content("Created by: #{@user.first_name} #{@user.last_name}")
  end

  scenario "A logged in admin fails to create a new program" do
    visit "/"
    click_link "Welcome, #{@user.first_name} #{@user.last_name}"
    click_link "Admin Area"

    expect(current_path).to eq admin_programs_path
    click_link "Create new"

    expect(current_path).to eq new_admin_program_path
    fill_in "Title", with: ""
    fill_in "Description", with: ""
    click_button "Create program"

    expect(page).to have_content("errors")
    expect(page).to have_content("Program title can't be blank")
  end

end