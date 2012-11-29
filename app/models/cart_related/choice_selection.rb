class ChoiceSelection < ActiveRecord::Base
  belongs_to        :option_selection
  belongs_to        :choice
  attr_accessible   :name_at_checkout, :price_at_checkout, :choice_id

  def description
    choice.name
  end
end
