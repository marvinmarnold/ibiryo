class Vendor < User
  has_many        :ownerships, foreign_key: :user_id
  has_many        :shops, through: :ownerships
  has_many        :menus, through: :shops
  has_many        :menu_sections, through: :menus
end
