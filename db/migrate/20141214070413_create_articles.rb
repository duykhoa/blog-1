class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string   :title
    	t.text 		 :body
	    t.boolean	 :published, default: false, null: false
	    t.datetime :published_at
      t.timestamps
    end
  end
end
