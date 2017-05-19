class SchoolLevel < ActiveRecord::Base
  has_many :suitabilities
  has_many :programs, through: :suitabilities
end
