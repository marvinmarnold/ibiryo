class OptionSelection < ActiveRecord::Base
  belongs_to        :line_item
  belongs_to        :option
  has_many          :choice_selections
  attr_accessible   :name_at_checkout, :option_id, :choice_ids


  def choice_ids=(ids)
    Rails.logger.info "ONTOPOF #{ids}"
    if ids.instance_of? Array
      ids.each do |id|
        add_choice(id)
      end
    else
      add_choice(ids)
    end
  end

  def choice_ids
    self.choice_selections.pluck(:id) unless id.blank?
  end

  def subtotal
    total = 0
    choice_selections.each do |choice_selection|
      total += choice_selection.choice.price
    end
    total
  end

private

  def add_choice(choice_id)
    self.choice_selections.where(choice_id: choice_id).first_or_create! unless choice_id.blank?
  end
end
