class ShopsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_shops
  # GET /shops
  # GET /shops.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shops }
    end
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shop = @browsable_shops.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  # GET /shops/new
  # GET /shops/new.json
  def new
    @shop = Shop.new
    @shop.build_ownership if @shop.ownership.blank?
    @shop.build_contact if @shop.contact.blank?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop }
    end
  end

  # GET /shops/1/edit
  def edit
    @shop = @shops.find(params[:id])
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = @shops.new(params[:shop])
    filter_is_active

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: t("shops.create.notice_success") }
        format.json { render json: @shop, status: :created, location: @shop }
      else
        format.html { render action: "new" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shops/1
  # PUT /shops/1.json
  def update
    @shop = @shops.find(params[:id])
    filter_is_active

    respond_to do |format|
      if @shop.update_attributes(params[:shop])
        format.html { redirect_to @shop, notice: t("shops.update.notice_success") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop = @shops.find(params[:id])
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end

private

  def set_shops
    scoped_for_shopper(Shop)
  end

  def filter_is_active
    params[:shop].try(:delete, :is_active) unless current_user.can_administrate?(@shop)
  end
end