class LineItem < ActiveRecord::Base
  belongs_to        :cart
  belongs_to        :item
  attr_accessible   :booked_for,              :description_at_checkout,     :name_at_checkout,      :quantity,
                    :special_instructions,    :unit_price_at_checkout,      :item_id,               :cart_id

  def subtotal
    item.price * quantity
  end
end
