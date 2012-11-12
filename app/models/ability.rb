class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted?
      can :manage, Information, user_id: user.id
    end
  end
end
