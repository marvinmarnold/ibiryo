class Participation < ActiveRecord::Base
  belongs_to :shop
  belongs_to :marketing_strategy
  attr_accessible :marketing_strategy_id
end
