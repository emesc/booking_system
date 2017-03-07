class Program < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_mode

  has_many :suitabilities
  has_many :school_levels, through: :suitabilities

  scope :sort_by_name, -> { order(program_title: :ASC) }

  def self.search(query)
    where("program_title like ? or program_description like ?", "%#{query}%", "%#{query}%")
  end
end
