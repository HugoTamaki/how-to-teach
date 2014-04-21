class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
    Methodology.joins(:user).where("users.first_name LIKE ? or users.last_name LIKE ? or methodologies.title LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") if search
  end

  has_many :methodologies
  has_many :friendships
  has_many :friends, through: :friendships
end
