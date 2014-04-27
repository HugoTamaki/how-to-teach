class Methodology < ActiveRecord::Base
  letsrate_rateable "qualidade"

	belongs_to :user

	validates :title, presence: true
	validates :content, presence: true

	scope :by_user, lambda{|user| where(user_id: user.id)}

  belongs_to :user
  has_many :comments
  has_many :videos
  accepts_nested_attributes_for :videos, 
                                :reject_if => proc { |att| att['url'].blank? },
                                :allow_destroy => true
end
