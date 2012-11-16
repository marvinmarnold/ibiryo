class Item < ActiveRecord::Base
  belongs_to :menu_section
  attr_accessible :is_active, :price
end
