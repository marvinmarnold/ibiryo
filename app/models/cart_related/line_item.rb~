class LineItem < ActiveRecord::Base
  belongs_to        :cart
  belongs_to        :item
  has_many          :option_selections
  accepts_nested_attributes_for :option_selections
  attr_accessible   :booked_for,                  :description_at_checkout,     :name_at_checkout,      :quantity,
                    :special_instructions,        :unit_price_at_checkout,      :item_id,               :cart_id,
                    :option_selections_attributes


  def update_options(option_selections)
    unless option_selections.blank?
      option_selections.each do |key, attributes|
        choice_ids = attributes.delete(:choice_ids)
        option = self.option_selections.create!(attributes)
        option.update_attributes(choice_ids: choice_ids)
      end
    end
  end

  def subtotal
    total = item.price * quantity
    option_selections.each do |option_selection|
      total += option_selection.subtotal
    end
    total
  end


end
