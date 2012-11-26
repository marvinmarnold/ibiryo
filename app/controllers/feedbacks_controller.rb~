class FeedbacksController < ApplicationController

  load_and_authorize_resource
  before_filter :set_feedbacks

  # GET /feedbacks
  # GET /feedbacks.json
  def index

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedback = @feedbacks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /feedbacks/new
  # GET /feedbacks/new.json
  def new
    @feedback = Feedback.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = @feedbacks.find(params[:id])
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = @feedbacks.new(params[:feedback])

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /feedbacks/1
  # PUT /feedbacks/1.json
  def update
    @feedback = @feedbacks.find(params[:id])

    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback = @feedbacks.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to feedbacks_url }
    end
  end
private

  def set_feedbacks
    scoped_for_shopper(Feedback)
  end
end
