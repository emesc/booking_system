module ApplicationHelper
  def company_bs
    Faker::Company.bs.capitalize + "!"
  end

  def hipster_statements
    Faker::Hipster.sentences(5).join(" ")
  end
end
