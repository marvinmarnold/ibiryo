class PagesController < ApplicationController
  skip_authorization_check

  def about
  end

  def security
  end

  def feedback
  end

  def help
  end

  def legal
  end

  def index
    redirect_to start_path(scope: params[:scope]) unless user_signed_in?
  end
end
