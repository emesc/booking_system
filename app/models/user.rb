class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable, :trackable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  belongs_to :role

  has_many :customers, class_name: "User", foreign_key: :creator_id
  belongs_to :creator, class_name: "User", optional: true

  has_many :programs

  has_many :bookings

  scope :admin_email, -> { where(role_id: 1).order(email: :ASC) }
  scope :admins_first, -> { order(role_id: :ASC).order(email: :ASC) }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  validates_presence_of :first_name, :last_name
  # validation happens before save, app throws an error about missing role if before_save is used
  before_validation :assign_role

  before_save :downcase_email

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
      self.role = Role.find_by(name: "Regular") if self.role.nil?
    end

    def downcase_email
      self.email = email.downcase
    end

end
