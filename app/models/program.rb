class Program < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_mode

  has_many :suitabilities
  has_many :school_levels, through: :suitabilities

  mount_uploader :image, ImageUploader
  validate :image_size

  scope :sort_by_name, -> { order(program_title: :ASC) }

  def self.search(query)
    where("program_title like ? or program_description like ?", "%#{query}%", "%#{query}%")
  end

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
