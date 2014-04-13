class Ability
  include CanCan::Ability

  def initialize(user)
    can [:manage], Methodology, user_id: user.id
    can [:read], Methodology
  end
end
