class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
    find(:all, :conditions => ['first_name LIKE ? or last_name LIKE ?', "%#{search}%", "%#{search}%"]) if search
  end
end
