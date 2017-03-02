class Program < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_mode
  belongs_to :school_level
end
