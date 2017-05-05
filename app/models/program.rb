class Program < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_mode

  has_many :bookings
  has_many :suitabilities
  has_many :school_levels, through: :suitabilities

  mount_uploader :image, ImageUploader
  validate :image_size
  validates_presence_of :program_title, :program_description, :program_fee, :duration, :topics, :group_size_min, :group_size_max, :time_am, :time_pm

  scope :sort_by_name, -> { order(program_title: :ASC) }

  def self.search(query)
    where("program_title ILIKE ? or program_description ILIKE ?", "%#{query}%", "%#{query}%")
  end

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
