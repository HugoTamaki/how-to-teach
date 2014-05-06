class Image < ActiveRecord::Base
  belongs_to :methodology

  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :image, content_type: {content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"]},
                                size: { :in => 0..300.kilobytes }
end
