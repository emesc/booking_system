class Message < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name,    presence: true,
                      length: { minimum: 10, maximum: 50 }
  validates :email,   presence: true,
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }
  validates :content, presence: true
end
