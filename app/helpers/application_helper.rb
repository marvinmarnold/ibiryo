module ApplicationHelper
  def root_path_for_shopper
    (@shopper.role? :vendor) ? shops_path : root_path
  end

  def admin_preview_locale
    (params[:admin_preview_locale].present? and Locale.find_by_abbr(admin_preview_locale)) ?
      Locale.find_by_abbr(params[:admin_preview_locale]) :
      Locale.find_by_abbr(I18n.locale)
  end

  def pretending_to_be_customer?
    params[:as_customer].present? and params[:as_customer] == "true"
  end

  def append_word(original, should_append, word)
    (should_append) ? "#{original} #{word}" : original
  end

  def can_and_want_see_everything?
    can?(:update, Shop) and not pretending_to_be_customer?
  end

  def has_option_to_preview_shop?(shop)
    can_and_want_see_everything? and
    @stuck_shop.present? and
    shop.id == @stuck_shop.id and
    controller.controller_name != "shops" and
    controller.action_name != "show"
  end
end
