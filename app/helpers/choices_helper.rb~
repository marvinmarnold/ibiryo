module ChoicesHelper

  def choice_price(choice)
    price = (choice.price > 0) ? number_to_shop_currency(choice.price, choice.shop) : t("general.free")
  end

  def choice_label(choice_form, one_button, count, num_options)
    choice = Choice.find(choice_form.value)
    button_method = choice_button(one_button)
    choice_form.label { render("choices/show", button: choice_form.send(button_method),
                        name: choice.name, price: choice_price(choice),
                        count: count, num_options: num_options) }
  end

  def choice_select_type(option)
    (option.one_choice?) ?  :collection_radio_buttons : :collection_check_boxes
  end

  def choice_button(one_button)
    (one_button)? :radio_button : :check_box
  end

  def choices_in_row
    3
  end

  def start_choice_row?(count)
    count % choices_in_row == 0
  end

  def end_choice_row?(count)
    count % choices_in_row == choices_in_row - 1
  end

end
