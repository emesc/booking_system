class SchoolLevel < ApplicationRecord
  has_many :suitabilities
  has_many :programs, through: :suitabilities
end
