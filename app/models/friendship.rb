class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  validate :cant_add_yourself

  def cant_add_yourself
    if user_id == friend_id
      errors.add(:friend_id, "Você não pode adicionar a si mesmo")
    end
  end
end
