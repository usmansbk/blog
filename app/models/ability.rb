class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.admin?
      can :manage, :all
    else
      can %i[update destroy], Post, user: user
      can :destroy, Comment, user: user
      can %i[read create], :all
    end
  end
end
