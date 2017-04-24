class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role

  # return all users created under this user (admin/manager)
  has_many :customers, class_name: "User", foreign_key: :creator_id
  # return this customer's creator
  belongs_to :creator, class_name: "User", optional: true

  # allow this user (admin only) to be creator of programs
  has_many :programs

  scope :admin_email, -> { where(role_id: 1).order(email: :ASC) }
  scope :admins_first, -> { order(role_id: :ASC).order(email: :ASC) }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  # validation happens before save, app throws an error about missing role if before_save is used
  before_validation :assign_role

  before_save :downcase_email

  # # enable only when creating the very first user
  # validate :null_creator_only_for_first_admin, on: :create

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

    # # enable only when creating the very first user; only the first admin is allowed to have no creator
    # def null_creator_only_for_first_admin
    #   errors.add(:creator_id, "must be present") if User.first.present?
    # end

    # default user to Regular upon creation
    def assign_role
      self.role = Role.find_by(name: "Regular") if self.role.nil?
    end

    # converts email to all lower case
    def downcase_email
      self.email = email.downcase
    end

end
