class Article < ActiveRecord::Base
  acts_as_taggable
	belongs_to :category
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: { minimum:1 }
	validates :thumbnail, presence: true
	has_attached_file :thumbnail, :styles => { :thumb => "200x200#" }, :default_url => "/images/:style/missing.png"
	self.per_page = 12
	validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

  scope :latest, lambda { order(created_at: :desc) }
end
