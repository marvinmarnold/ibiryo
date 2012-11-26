class LineItem < ActiveRecord::Base
  belongs_to        :cart
  belongs_to        :item
  has_many          :option_selections
  accepts_nested_attributes_for :option_selections
  attr_accessible   :booked_for,              :description_at_checkout,     :name_at_checkout,      :quantity,
                    :special_instructions,    :unit_price_at_checkout,      :item_id,               :cart_id,
                    :options_selections_attributes

  def options(item)
    item.options.each do |option|
      o = self.option_selections.where(option_id: option.id).first_or_initialize
      o.choice_selections.build
    end
    self.option_selections
  end

  def subtotal
    item.price * quantity
  end
end
