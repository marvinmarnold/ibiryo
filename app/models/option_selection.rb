class OptionSelection < ActiveRecord::Base
  belongs_to        :line_item
  belongs_to        :option
  has_many          :choice_selections
  accepts_nested_attributes_for :choice_selections
  attr_accessible   :name_at_checkout, :choice_selections_attributes
end
