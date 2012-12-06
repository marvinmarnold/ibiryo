module ShopsHelper
#another change
  def stuck_class(stuck)
    base_class = "well shop-sideview"
    (stuck) ?  "#{base_class} stuck-shop" : "#{base_class} clickable-shop"
  end

  def shop_time(shop)
    day_of_week = Time.now.strftime("%A").downcase
    opening_time = shop.send("opens_#{day_of_week}_at").try(:to_time)
    closing_time = shop.send("closes_#{day_of_week}_at").try(:to_time)
    if Time.now > opening_time and Time.now < closing_time
      return "#{t("shops.show_sideview.restaurant.closes")}: #{time_friendly(closing_time)}"
    else
      return "#{t("shops.show_sideview.restaurant.opens")}: #{time_friendly(opening_time)}"
    end
  end

  def toggle_as_user
    (params[:as_customer] == "true") ? {as_customer: "false"} : {as_customer: "true"}
  end

  def time_friendly(time)
    time.strftime("%H:%M")
  end

  def delivery_fee(shop)
    (shop.delivery_fee > 0) ?
      "#{t("shops.show_sideview.restaurant.delivery_fee")}: #{number_to_shop_currency(shop.delivery_fee, shop)}" :
      t("shops.show_sideview.restaurant.free_delivery")
  end

  def delivery_minimum(shop)
    (shop.delivery_minimum > 0) ?
    "#{t("shops.show.information.restaurant.delivery_minimum.title")}: #{number_to_shop_currency(shop.delivery_minimum, shop)}" :
     t("shops.show.information.restaurant.no_minimum")
  end

  def number_to_shop_currency(number, shop)
    "#{number_to_currency(number, locale: shop.currency.locale_abbr)}"
  end

  def today
    Time.now.strftime('%A').downcase
  end

  def menus
    (can_and_want_see_everything?) ? @shop.menus : @shop.menus.where(is_active: true)
  end

  def menu_sections(menu)
    (can_and_want_see_everything?) ? menu.menu_sections : menu.menu_sections.where(is_active: true)
  end

  def items(menu_section)
    (can_and_want_see_everything?) ? menu_section.items : menu_section.items.where(is_active: true)
  end

  def shop_price(item)
    modifier = (item.fixed_price?) ? "" : "+"
    "#{number_to_shop_currency(item.price, item.menu_section.menu.shop)}#{modifier}"
  end

  def shop_thumbnail(shop)
    #image_tag shop.thumbnail.usable.url, class: "img-rounded"
    image_tag "logo#{rand(15)+1}.jpg", class: "img-rounded"
  end

end
