class AddAttachmentThumbnailToArticles < ActiveRecord::Migration
  def self.up
    add_attachment :articles, :thumbnail
  end

  def self.down
    remove_attachment :articles, :thumbnail
  end
end
