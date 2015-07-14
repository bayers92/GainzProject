class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    can :manage, Workout
    can :manage, Part
  end
end
