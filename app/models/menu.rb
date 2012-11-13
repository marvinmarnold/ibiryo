class Menu < Describable
  belongs_to        :shop
  has_many          :menu_sections
  attr_accessible   :is_active
end
