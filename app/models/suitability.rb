class Suitability < ActiveRecord::Base
  belongs_to :program
  belongs_to :school_level
end
