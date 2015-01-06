class Comment < ActiveRecord::Base
  belongs_to :article
  
  validates :title, presence: true, length: { minimum: 1 }
  validates :body, presence: true, length: { minimum: 1 }
end
