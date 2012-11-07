module ApplicationHelper
  def guest_language_locales
    CONFIG[:language_locales]
  end
end
