class Cart < ActiveRecord::Base
  belongs_to        :shop
  belongs_to        :user
  has_many          :line_items
  attr_accessible   :billed_card_expiration,        :billed_card_last_four,       :billed_card_type,
                    :billed_city,                   :billed_method,               :billed_province,
                    :billed_room,                   :billed_street,               :currency_at_checkout,
                    :initiated_at,                  :settled_at,                  :service_fee,
                    :shipped_city,                  :shipped_directions,          :shipped_primary_phone,
                    :shipped_province,              :shipped_room,                :shipped_secondary_phone,
                    :shipped_street,                :shipping_fee,
                    :shop_name_at_checkout,         :special_instructins,
                    :tax

  SERVICE_FEE = CONFIG["fees"]["service"]

  def shopping?
    line_items.each do |line_item|
      return true if line_item.persisted?
    end
    return false
  end

  def next_step_path
    if initiated_at.blank?
      "edit_cart_path(self)"
    elsif settled_at.blank?

    else
      raise "TODO: cart.rb"
    end
  end

  def subtotal
    t = 0
    line_items.each do |line_item|
      t += line_item.subtotal
    end
    t
  end

  def service_fee
    Currency.find_by_abbr(CONFIG["fees"]["currency_abbr"]).convert(SERVICE_FEE, shop.currency)
  end

  def total(include_delivery = true)
    t = subtotal
    t += shop.delivery_fee if include_delivery
    t += SERVICE_FEE
  end

end
