class ChoicesController < ApplicationController
  load_and_authorize_resource
  before_filter :set_choices

  # GET /choices/new
  # GET /choices/new.json
  def new
    @choice = Choice.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /choices/1/edit
  def edit
    @choice = @choices.find(params[:id])
  end

  # POST /choices
  # POST /choices.json
  def create
    @choice = @choices.new(params[:choice])

    respond_to do |format|
      if @choice.save
        format.html { redirect_to new_shop_choice_path(@shop), notice: t("choices.update.notice_success") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /choices/1
  # PUT /choices/1.json
  def update
    @choice = @choices.find(params[:id])

    respond_to do |format|
      if @choice.update_attributes(params[:choice])
        format.html { redirect_to @shop, notice: t("choices.update.notice_success") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /choices/1
  # DELETE /choices/1.json
  def destroy
    @choice = @choices.find(params[:id])
    @choice.destroy

    respond_to do |format|
      format.html { redirect_to choices_url }
    end
  end

private

  def set_choices
    set_parent_from_nested_route(Shop)
    set_stuck_shop(@shop)
    @choices = @shop.choices
  end
end
