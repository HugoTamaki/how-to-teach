class User < ActiveRecord::Base
  letsrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
    Methodology.joins(:user).where("users.first_name LIKE :search or users.last_name LIKE :search or methodologies.title LIKE :search", search: "%#{search}%") if search
  end

  has_attached_file :avatar, styles: { :profile => "100x100>", :search_thumb => "30x30>" }, 
                              default_url: "avatar-blank-:style.jpg"
  validates_attachment :avatar, content_type: {content_type: ["image/jpg", "image/gif", "image/png"]},
                                size: { :in => 0..200.kilobytes }

  has_many :methodologies
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :comments
  has_many :feeds
  has_many :schools
  accepts_nested_attributes_for :schools, 
                                :reject_if => proc { |att| att['name'].blank? },
                                :allow_destroy => true

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.post_feed(user, message)
    if user.friends
      user.friends.each do |friend|
        feed = Feed.new message: message
        friend.feeds << feed
        friend.save
      end
    end
  end
end
