class Feed < ActiveRecord::Base
  belongs_to :user

  def after_initialize message
    self.message = message
  end
end
