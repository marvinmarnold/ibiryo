class OptionsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_options

  # GET /options/new
  # GET /options/new.json
  def new
    @option = @options.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /options/1/edit
  def edit
    @option = @options.find(params[:id])
  end

  # POST /options
  # POST /options.json
  def create
    @option = @options.new(params[:option])

    respond_to do |format|
      if @option.save
        format.html { redirect_to new_shop_option_path(@shop), notice: t("options.create.notice_success") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /options/1
  # PUT /options/1.json
  def update
    @option = @options.find(params[:id])

    respond_to do |format|
      if @option.update_attributes(params[:option])
        format.html { redirect_to @shop, notice: t("options.update.notice_success") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option = @options.find(params[:id])
    @option.destroy

    respond_to do |format|
      format.html { redirect_to options_url }
    end
  end

private

  def set_options
    set_parent_from_nested_route(Shop)
    set_stuck_shop(@shop)
    @options = @shop.options
  end
end
