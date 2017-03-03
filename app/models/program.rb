class Program < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_mode

  has_many :suitabilities
  has_many :school_levels, through: :suitabilities
end
