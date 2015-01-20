class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration
  def change
    add_column :articles, :address, :string
  end
end
