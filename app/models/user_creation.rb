class UserCreation < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: "User"
end