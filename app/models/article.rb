class Article < ActiveRecord::Base
	belongs_to :category

	validates :title, presence: true, length: { minimum:1 }
	validates :thumbnail, presence: true
	has_attached_file :thumbnail, :styles => { :thumb => "200x200#" }, :default_url => "/images/:style/missing.png"
	self.per_page = 20
	validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

end
