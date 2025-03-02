class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    cannot :manage, User
    can [:read], Category
    cannot %i[create update destroy], Category
    can(%i[create read], Order, user:)
    cannot %i[update destroy], Order
    can :read, Product
    cannot %i[create update destroy], Product
    can :manage, Cart
    can :manage, LineItem
    can [:read], Article
    cannot %i[create update destroy], Article

    if user.admin?
      can :manage, User, user: user
      can %i[create read], Order
      cannot %i[update destroy], Order
      can :manage, Category
      can :manage, Product
      can :manage, Cart
      can :manage, Article
      can :manage, LineItem
    end

    return unless user.sysadmin?

    can :manage, :all

    # Define abilities for the user here. For example:
    #
    # return unless user.present?
    # can :read, :
    # return unless user.admin?
    # can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
