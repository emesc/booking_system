class User < ApplicationRecord
  belongs_to :role

  scope :admin_email, -> { where(role_id: 1).order(email: :ASC) }
end
