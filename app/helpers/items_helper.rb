module ItemsHelper
  def popup_title(item, shop)
    "<b>#{item.name}</b><br/>#{shop_price(item)} #{price_explanation(item)}"
  end

  def placement(item_in_row)
    (item_in_row % 2 == 0) ? "right" : "left"
  end


  def row_class(count)
    (count % 2 == 0) ? "item-main" : "item-secondary"
  end

  def price_explanation(item)
    (item.fixed_price?) ? "" : "#{t("items.show.price_explanation")}"
  end

end
