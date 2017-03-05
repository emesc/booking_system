module ApplicationHelper
  def company_bs
    Faker::Company.bs.capitalize + "!"
  end

  def hipster_statements
    Faker::Hipster.sentences(5).join(" ")
  end

  def temp_popular_programs
    content_tag :li do
      content_tag :a, Faker::Hipster.sentence
    end
  end
end
