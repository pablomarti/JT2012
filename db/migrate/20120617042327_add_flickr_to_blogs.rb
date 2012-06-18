class AddFlickrToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :flickr, :text
  end
end
