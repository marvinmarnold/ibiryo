class ShopsController < ApplicationController
  load_and_authorize_resource
  before_filter       :set_shops, except: [:show, :new]
  skip_before_filter  :set_browsable_shops, only: [:show]

  # GET /shops
  # GET /shops.json
  def index
    @shops = @shops.paginate(:page => params[Shop.vendor_page_param], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    authorize! :show, Shop
    @browsable_shops = Shop.where(is_active: true)
    @shop = @browsable_shops.find(params[:id])
    filter_and_paginate_browsable_shops
    @cart = @shopper.current_cart_for(@shop)
    @line_item = LineItem.new

    set_stuck_shop(@shop)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /shops/new
  # GET /shops/new.json
  def new
    @shop = Shop.new
    @shop.build_contact if @shop.contact.blank?

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /shops/1/edit
  def edit
    @shop = @shops.find(params[:id])
    set_stuck_shop(@shop)
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = @shops.new(params[:shop])
    filter_is_active

    respond_to do |format|
      if @shop.save
        format.html { redirect_to new_shop_menu_path(@shop), notice: t("shops.create.notice_success") }
      else
        format.html { render action: "new" }
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
      else
        format.html { render action: "edit" }
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
