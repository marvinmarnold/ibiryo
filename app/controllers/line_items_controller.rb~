class LineItemsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_line_items, except: [:new]

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = @line_items.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = @line_items.build(params[:line_item])

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @cart.shop, notice: t("line_items.create.notice_success") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = @line_items.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @cart.shop, notice: t("line_items.update.notice_success") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = line_items.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url }
    end
  end

private

  def set_line_items
    set_parent_from_nested_route(Cart)
    @line_items = @cart.line_items
  end
end
