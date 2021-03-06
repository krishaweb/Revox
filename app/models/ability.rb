class Ability
  include CanCan::Ability

  def initialize(user)    
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.member?
      can [:edit, :update, :destroy], User, user_id: user.id
    end
  end
end