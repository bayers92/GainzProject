class UserAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, Score, :user_id => user.id
    can :read, Workout
  end
end
