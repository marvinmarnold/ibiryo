class Salesmanager < User
  has_many  :supervisions, foreign_key: :salesmanager_id
  has_many  :salespersons, through: :supervisions
  has_many  :indirectly_managed_shops, through: :salespersons
  has_many  :indirectly_managed_menus, through: :indirectly_managed_shops
  has_many  :accountabilities, foreign_key: :user_id
  has_many  :directly_managed_shops, through: :accountabilities
  has_many  :directly_managed_menus, through: :shops
  has_many  :directly_managed_menu_sections, through: :menus


private

end
