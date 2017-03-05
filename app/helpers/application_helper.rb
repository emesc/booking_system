module ApplicationHelper

  # for seeding
  def company_bs
    Faker::Company.bs.capitalize + "!"
  end

  # for seeding
  def hipster_statements
    Faker::Hipster.sentences(5).join(" ")
  end

  # for sidebar, programs view for regular users
  def temp_popular_programs
    content_tag :li do
      content_tag :a, Faker::Hipster.sentence
    end
  end

  # for assigning the active class in admin views
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  # for showing full name
  def full_name(first_name, last_name)
    first_name + " " + last_name 
  end
end
