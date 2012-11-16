class MarketingStrategy < ActiveRecord::Base
  has_many          :participations
  has_many          :shops, through: :participations

  attr_accessible   :name, :is_active

  validates         :is_active, :inclusion => { in: [true, false]}

end
