class Article < ActiveRecord::Base
	belongs_to :category
	has_many :comments, dependent: :destroy
  #geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  #after_validation :geocode
  #geocoded_by :address
  #after_validation :geocode
  reverse_geocoded_by :latitude, :longitude,
  :address => :article
  after_validation :reverse_geocode
	validates :title, presence: true, length: { minimum:1 }
	validates :thumbnail, presence: true
	has_attached_file :thumbnail, :styles => { :thumb => "200x200#" }, :default_url => "/images/:style/missing.png"
	self.per_page = 12
	validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
end
