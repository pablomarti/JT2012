class Blog < ActiveRecord::Base

  attr_accessible :content_es, :content_en, :title_es, :title_en, :flickr

  attr_accessor :user_lang

  def content
  	if @user_lang == "es"
  		return content_es
	else
		return content_en
	end
  end

  def title
  	if @user_lang == "es"
  		return title_es
    else
		  return title_en
    end
  end

end
