class ItemsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_items
  # GET /items
  # GET /items.json
  def index
    @items = @items.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = @items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /items/1/edit
  def edit
    @item = @items.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = @items.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to new_menu_section_item_path(@menu_section), notice: t("items.create.notice_success") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = @items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @menu_section.menu.shop, notice: t("menu_sections.update.notice_success") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = @items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
    end
  end

private

  def set_items
    set_parent_from_nested_route(MenuSection)
    @items = @menu_section.items
  end

end
