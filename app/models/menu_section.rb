class MenuSection < ActiveRecord::Base
  belongs_to :menu
  attr_accessible :is_active
end
