class User < ActiveRecord::Base
  letsrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
    Methodology.joins('left join users as u 
                          on u.id = methodologies.user_id 
                       left join rating_caches as r 
                          on methodologies.id = r.cacheable_id').where('u.first_name LIKE :search 
                          or u.last_name LIKE :search 
                          or methodologies.title LIKE :search', search: "%#{search}%").order('r.avg desc') if search
  end

  has_attached_file :avatar, styles: { :profile => "100x100>", :search_thumb => "30x30>" }, 
                              default_url: "avatar-blank-:style.jpg"
  validates_attachment :avatar, content_type: {content_type: ["image/jpg", "image/gif", "image/png"]},
                                size: { :in => 0..200.kilobytes }

  has_many :methodologies, dependent: :destroy
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
