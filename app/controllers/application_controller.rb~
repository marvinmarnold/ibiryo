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

  def set_parent_from_nested_route(parent)
    scoped_for_shopper(parent)
    parent_klasses = ActiveModel::Naming.plural(parent)
    parent_klass = ActiveModel::Naming.singular(parent)
    instance_variable_set "@#{parent_klass}", eval("@#{parent_klasses}").find(params["#{parent_klass}_id"])
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
      u.default_locale_id = Locale.find_by_abbr(I18n.locale.to_s).id
    end
  end

  def set_locale
    if user_signed_in?
      desired_locale = current_user.default_locale.abbr
    elsif params[:locale].present?
      desired_locale = params[:locale]
    end
    I18n.locale = desired_locale if desired_locale.present?
  end

  def set_browsable_shops
    @browsable_shops = Shop.where(is_active: true).paginate(:page => params[Shop.page_param], :per_page => 17)
  end

  def session_id
    request.session_options[:id]
  end

  #=begin
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_url
    else
      redirect_to root_url, alert: t("general.authorization_login_required")
    end
  end
  #=end
end
