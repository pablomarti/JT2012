class MainController < ApplicationController
	
  def index
    load_page("index")
  end

  def about
    load_page("about")
  end

  def lux
    load_page("lux")
  end

  def contact
    load_page("contact")
  end

  def change_lang
    if params[:lang] == "es" || params[:lang] == "en"
      session[:lang] = params[:lang]
    end
    redirect_to init_path
    return
  end

  def load_page(partial_name)
    @partial_name = partial_name

    @pop = 0
    if !params[:pop].nil? && params[:pop].to_i == 1
      @pop = 1
    end

    respond_to do |format|
      format.html
      format.js { render "load_page" }
    end
  end

end
