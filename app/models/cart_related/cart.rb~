class Cart < ActiveRecord::Base
  belongs_to        :shop
  belongs_to        :user
  has_many          :line_items
  attr_accessible   :special_instructions,  :ship,    :billed_method, :billed_card_expiration
  attr_accessor     :card_number,            :card_cvv

  SERVICE_FEE = CONFIG["fees"]["service"]

  def shopping?
    line_items.each do |line_item|
      return true if line_item.persisted?
    end
    return false
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
