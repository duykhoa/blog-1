class Article < ActiveRecord::Base
	belongs_to :category

	validates :title, presence: true, length: { minimum:1 }
	validates :thumbnail, presence: true
	has_attached_file :thumbnail, :styles => {
		:thumb => "200x200#"
	}
	self.per_page = 20
end
