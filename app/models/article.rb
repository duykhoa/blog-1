class Article < ActiveRecord::Base
	belongs_to :category
	has_many :comments, dependent: :destroy
        geocoded_by :ip_address, :latitude => :latitude, :longitude => :longtitude
        after_validation :geocode
	validates :title, presence: true, length: { minimum:1 }
	validates :thumbnail, presence: true
	has_attached_file :thumbnail, :styles => { :thumb => "200x200#" }, :default_url => "/images/:style/missing.png"
	self.per_page = 12
	validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

	def ip_address
		'8.8.8.8'
	end
end
