class ChangeLangsOnBlogs < ActiveRecord::Migration
  def up
  	remove_column :blogs, :title
  	remove_column :blogs, :content
  	add_column :blogs, :title_es, :string
  	add_column :blogs, :title_en, :string
  	add_column :blogs, :content_es, :text
  	add_column :blogs, :content_en, :text
  end

  def down
  	add_column :blogs, :title, :string
  	add_column :blogs, :content, :text
  	remove_column :blogs, :title_es
  	remove_column :blogs, :title_en
  	remove_column :blogs, :content_es
  	remove_column :blogs, :content_en
  end
end
