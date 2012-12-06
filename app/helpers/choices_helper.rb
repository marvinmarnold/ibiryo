module ChoicesHelper

  def choice_price(choice)
    price = (choice.price > 0) ? number_to_shop_currency(choice.price, choice.shop) : t("general.free")
  end

end
