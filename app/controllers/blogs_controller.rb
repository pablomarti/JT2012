class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    @blogs.map{ |blog|
      blog.user_lang = session[:lang]
    }

    load_page("posts", "index")
  end

  def show
    @blog = Blog.find(params[:id])
    @blog.user_lang = session[:lang]

    load_page("post/" + @blog.id.to_s, "show")
  end

  # GET /blogs/new
  # GET /blogs/new.json
  def new
    if !can_access
      redirect_to init_path
      return
    end

    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/1/edit
  def edit    
    @blog = Blog.find(params[:id])

    if !can_access(@blog.admin_id)
      redirect_to init_path
      return
    end
  end

  # POST /blogs
  # POST /blogs.json
  def create
    if !can_access
      redirect_to init_path
      return
    end

    @blog = Blog.new(params[:blog])
    @blog.admin_id = session[:user_level]

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blog.find(params[:id])  

    if !can_access(@blog.admin_id)
      redirect_to init_path
      return
    end

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])  

    if !can_access(@blog.admin_id)
      redirect_to init_path
      return
    end
    
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  def load_page(partial_name, real_name)
    @partial_name = partial_name
    @real_name = real_name

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
