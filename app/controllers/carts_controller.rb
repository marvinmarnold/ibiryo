class CartsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_carts

  # GET /carts
  # GET /carts.json
  def index
    @carts = @carts.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = @carts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end


  # GET /carts/1/edit
  def edit
    @cart = @carts.find(params[:id])
    @shop = @cart.shop
    set_stuck_shop(@shop)
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update

    @cart = @carts.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to state_edit_cart_path(@cart) }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = @carts.find(params[:id])
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url }
    end
  end

private

  def set_carts
    scoped_for_shopper(Cart)
  end

  def state_edit_cart_path(cart)
    edit_cart_path(cart)
  end
end
