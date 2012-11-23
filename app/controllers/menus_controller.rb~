class MenusController < ApplicationController
  load_and_authorize_resource
  before_filter :set_menus

  # GET /menus
  # GET /menus.json
  def index
    @menus = @menus.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = @menus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /menus/new
  # GET /menus/new.json
  def new
    @menu = Menu.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = @menus.new(params[:menu])

    respond_to do |format|
      if @menu.save
        format.html { redirect_to new_menu_menu_section_path(@menu), notice: t("menus.create.notice_success") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update
    @menu = @menus.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to @shop, notice: t("menus.update.notice_success") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu = @menus.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
    end
  end

private

  def set_menus
    set_parent_from_nested_route(Shop)
    @menus = @shop.menus
  end
end
