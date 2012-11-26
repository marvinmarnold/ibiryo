module CartsHelper
  def shopping?
    @cart.present? and
    @cart.shopping? and
    controller.controller_name == "shops" and
    controller.action_name == "show"
  end

  def delivery_label_for(delivery_method)
    case delivery_method.value
      when true
        delivery_method.label { render("carts/delivery",
                                                        button: delivery_method.radio_button) }
      when false
        delivery_method.label { render("carts/pickup",
                                                        button: delivery_method.radio_button ) }
    end
  end
end
