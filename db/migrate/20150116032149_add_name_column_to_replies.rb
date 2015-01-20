class AddNameColumnToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :name, :string
  end
end
