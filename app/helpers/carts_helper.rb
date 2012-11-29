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

  def payment_label_for(payment_method)
    case payment_method.value
      when "Credit Card"
        payment_method.label { render("carts/payment_method", button: payment_method.radio_button,
                                                                  image: credit_buttons, text: "Cash" ) }
      when "Cash"
        payment_method.label { render("carts/payment_method", button: payment_method.radio_button,
                                                                  image: image_tag("cash.png"), text: "Credit Card" )}
      when "PayPal Express"
        payment_method.label { render("carts/payment_method", button: payment_method.radio_button,
                                                                  image: image_tag("paypal.png"), text: "PayPal" ) }
    end
  end

  def credit_buttons
    image_tag("visa.png") + image_tag("mastercard.png") + image_tag("discover.png") + image_tag("american_express.png") + image_tag("jcb.png")
  end

end
