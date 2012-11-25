module ItemsHelper
  def popup_title(item, shop)
    "<b>#{item.name}</b><br/>#{number_to_shop_currency(item.price, item.menu_section.menu.shop)}"
  end

  def placement(item_in_row)
    (item_in_row % 2 == 0) ? "right" : "left"
  end


  def row_class(count)
    (count % 2 == 0) ? "item-main" : "item-secondary"
  end

end
