class Management < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  attr_accessible :user_id
end
