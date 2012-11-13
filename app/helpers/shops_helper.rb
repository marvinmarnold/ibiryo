module ShopsHelper
  def stuck_class(stuck)
    base_class = "well"
    (stuck) ?  "#{base_class}" : "#{base_class} clickable-shop"
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

  def time_friendly(time)
    time.strftime("%H:%M")
  end

  def delivery_fee(shop)
    (shop.delivery_fee > 0) ? "#{t("shops.show_sideview.restaurant.delivery_fee")}: #{number_to_shop_currency(shop.delivery_fee, shop)}" :
                              t("shop.show_sideview.restaurant.free_delivery")
  end

  def number_to_shop_currency(number, shop)
    "#{number_to_currency(number, locale: locale_for_currency(shop.currency))}"
  end

  def locale_for_currency(currency)

  end
end
