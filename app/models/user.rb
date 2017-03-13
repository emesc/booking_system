class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :programs

  scope :admin_email, -> { where(role_id: 1).order(email: :ASC) }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  before_save :downcase_email, :assign_role

  def admin?
    self.role.name == "Admin"
  end

  def manager?
    self.role.name == "Manager"
  end

  def regular?
    self.role.name == "Regular"
  end

  private

    # default user to Regular upon creation
    def assign_role
      self.role = Role.find_by name: "Regular" if self.role.nil?
    end

    # converts email to all lower case
    def downcase_email
      self.email = email.downcase
    end
end
