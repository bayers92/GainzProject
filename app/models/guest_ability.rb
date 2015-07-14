class GuestAbility
  include CanCan::Ability

  def initialize(user)
    can :read, Workout
  end
end
