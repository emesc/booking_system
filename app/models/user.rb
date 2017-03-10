class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_validation :assign_role
  belongs_to :role

  scope :admin_email, -> { where(role_id: 1).order(email: :ASC) }

  # default user to Regular upon creation
  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end
end
