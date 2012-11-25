class Cart < ActiveRecord::Base
  belongs_to        :shop
  belongs_to        :user
  has_many          :line_items
  attr_accessible   :billed_card_expiration,        :billed_card_last_four,       :billed_card_type,
                    :billed_city,                   :billed_method,               :billed_province,
                    :billed_room,                   :billed_street,               :currency_at_checkout,
                    :order_submitted_at,            :payment_settled_at,          :service_fee,
                    :shipped_city,                  :shipped_directions,          :shipped_primary_phone,
                    :shipped_province,              :shipped_room,                :shipped_secondary_phone,
                    :shipped_street,                :shipping_fee,                :shop_acknowledged_at,
                    :shop_name_at_checkout,         :shop_notified_at,            :special_instructins,
                    :tax

  def shopping?
    line_items.each do |line_item|
      return true if line_item.persisted?
    end
    return false
  end
end
