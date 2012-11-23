module ApplicationHelper
  def root_path_for_shopper
    (@shopper.role? :vendor) ? shops_path : root_path
  end

  def admin_preview_locale
    (params[:admin_preview_locale].present? and Locale.find_by_abbr(admin_preview_locale)) ?
      Locale.find_by_abbr(params[:admin_preview_locale]) :
      Locale.find_by_abbr(I18n.locale)
  end

  def can_administrate?(shop)
    can?(:update, Shop) and
    @shopper.can_administrate?(shop)
  end

  def pretending_to_be_customer?
    params[:as_customer].present? and params[:as_customer] == "true"
  end

  def append_word(original, should_append, word)
    (should_append) ? "#{original} #{word}" : original
  end

end
