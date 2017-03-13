class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. 
    guest = User.new
    guest.role = Role.new
    guest.role.name = "Regular"
    user ||= guest # guest user (not logged in)
    if user.admin?
      can :manage, :all
      # can [:index, :show, :new, :create, :edit, :update, :destroy], :admin
    elsif user.manager?
      can :read, Program
      can :read, SchoolLevel
      can :read, Category
      can :create, User
      can :read, User do |mngr|
        mngr.try(:user) == user
      end
      can :update, User do |mngr|
        mngr.try(:user) == user
      end
      can :destroy, User do |mngr|
        mngr.try(:user) == user
      end
    elsif user.regular?
      can :read, Program
      can :read, SchoolLevel
      can :read, Category
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
