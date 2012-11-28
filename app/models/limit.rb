class Limit < ActiveRecord::Base
  belongs_to :item
  belongs_to :frequency
  attr_accessible :frequency_ends_at, :frequency_starts_at, :offer_ends_at, :offer_starts_at, :price, :quantity
end
