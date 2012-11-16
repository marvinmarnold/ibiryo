class MarketingStrategiesController < ApplicationController
  load_and_authorize_resource
  # GET /marketing_strategies
  # GET /marketing_strategies.json
  def index
    @marketing_strategies = MarketingStrategy.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /marketing_strategies/new
  # GET /marketing_strategies/new.json
  def new
    @marketing_strategy = MarketingStrategy.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /marketing_strategies/1/edit
  def edit
    @marketing_strategy = MarketingStrategy.find(params[:id])
  end

  # POST /marketing_strategies
  # POST /marketing_strategies.json
  def create
    @marketing_strategy = MarketingStrategy.new(params[:marketing_strategy])

    respond_to do |format|
      if @marketing_strategy.save
        format.html { redirect_to marketing_strategies_path, notice: t("marketing_strategies.create.notice_success") }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /marketing_strategies/1
  # PUT /marketing_strategies/1.json
  def update
    @marketing_strategy = MarketingStrategy.find(params[:id])

    respond_to do |format|
      if @marketing_strategy.update_attributes(params[:marketing_strategy])
        format.html { redirect_to marketing_strategies_path, notice: t("marketing_strategies.update.notice_success") }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /marketing_strategies/1
  # DELETE /marketing_strategies/1.json
  def destroy
    @marketing_strategy = MarketingStrategy.find(params[:id])
    @marketing_strategy.destroy

    respond_to do |format|
      format.html { redirect_to marketing_strategies_url }
    end
  end
end
