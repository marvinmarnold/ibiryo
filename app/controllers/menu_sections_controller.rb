class MenuSectionsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_menu_sections
  # GET /menu_sections
  # GET /menu_sections.json
  def index
    @menu_sections = @menu_sections.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /menu_sections/1
  # GET /menu_sections/1.json
  def show
    @menu_section = @menu_sections.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /menu_sections/new
  # GET /menu_sections/new.json
  def new
    @menu_section = MenuSection.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /menu_sections/1/edit
  def edit
    @menu_section = @menu_sections.find(params[:id])
  end

  # POST /menu_sections
  # POST /menu_sections.json
  def create
    @menu_section = @menu_sections.new(params[:menu_section])

    respond_to do |format|
      if @menu_section.save
        format.html { redirect_to new_menu_section_item_path(@menu_section),
                                  notice: t("menu_sections.create.notice_success") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /menu_sections/1
  # PUT /menu_sections/1.json
  def update
    @menu_section = @menu_sections.find(params[:id])

    respond_to do |format|
      if @menu_section.update_attributes(params[:menu_section])
        format.html { redirect_to @menu.shop, notice: t("menu_sections.create.notice_success") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /menu_sections/1
  # DELETE /menu_sections/1.json
  def destroy
    @menu_section = @menu_sections.find(params[:id])
    @menu_section.destroy

    respond_to do |format|
      format.html { redirect_to menu_sections_url }
    end
  end

private
  def set_menu_sections
    set_parent_from_nested_route(Menu)
    set_stuck_shop(@menu.shop)
    @menu_sections = @menu.menu_sections
  end

end
