class User < ActiveRecord::Base
  letsrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
    Methodology.joins(:user).where("users.first_name LIKE :search or users.last_name LIKE :search or methodologies.title LIKE :search", search: "%#{search}%") if search
  end
  # ransack

  has_many :methodologies
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :comments
  has_many :schools
  accepts_nested_attributes_for :schools, 
                                :reject_if => proc { |att| att['name'].blank? },
                                :allow_destroy => true
end
