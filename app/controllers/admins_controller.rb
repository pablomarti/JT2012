class AdminsController < ApplicationController
  # GET /admins
  # GET /admins.json

  def index
    if !can_access(1)
      redirect_to init_path
      return
    end

    @admins = Admin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admins }
    end
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    if !can_access(1)
      redirect_to init_path
      return
    end

    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/new
  # GET /admins/new.json
  def new
    if !can_access(1)
      redirect_to init_path
      return
    end

    @pass = true
    @admin = Admin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/1/edit
  def edit
    if !can_access(1)
      redirect_to init_path
      return
    end

    @pass = false
    @admin = Admin.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    if !can_access(1)
      redirect_to init_path
      return
    end

    @pass = true
    @admin = Admin.new(params[:admin])

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: 'Admin was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /admins/1
  # PUT /admins/1.json
  def update
    if !can_access(1)
      redirect_to init_path
      return
    end

    @pass = false
    @admin = Admin.find(params[:id])

    if @admin.update_attributes(params[:admin])
      redirect_to admins_path
    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    if !can_access(1)
      redirect_to init_path
      return
    end
    
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end

end
