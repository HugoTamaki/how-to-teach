class Methodology < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true
	validates :content, presence: true

	scope :by_user, lambda{|user| where(user_id: user.id)}

  belongs_to :user
  has_many :comments
end
