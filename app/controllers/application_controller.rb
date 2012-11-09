class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization unless: :devise_controller?
  before_filter :setup

  def scoped_for_shopper(klass)
    klasses = ActiveModel::Naming.plural(klass)
    variable_name = "@#{klasses}"
    if @shopper.role? :admin
      instance_variable_set variable_name, klass.scoped
    else
      instance_variable_set variable_name, @shopper.send(klasses)
    end
  end

private
  def setup
    set_locale
    set_shopper
    set_browsable_shops
  end

  def set_shopper
    @shopper = current_user if user_signed_in?
    @shopper ||= Guest.where(temp_session_id: session_id).first_or_create do |u|
      u.email = "#{session_id}@#{(t "brand.tld")}"
      u.password = CONFIG["guest_user"]["default_password"]
      u.default_locale_id = Locale.find_by_is_default(true).id
    end
  end

  def set_locale
    if user_signed_in?
      desired_locale = current_user.default_locale
    elsif params[:locale].present?
      desired_locale = params[:locale]
    else
      desired_locale = Locale.find_by_is_default(true).abbr
    end
    I18n.locale = desired_locale
  end

  def set_browsable_shops
    @browsable_shops = Shop.where(is_active: true)
  end

  def session_id
    request.session_options[:id]
  end

  #=begin
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_url
    else
      redirect_to root_url, notice: t("general.authorization_login_required")
    end
  end
  #=end
end
