class Salesperson < User
  has_one         :supervision, foreign_key: :salesperson_id
  has_one         :salesmanager, through: :supervision
  has_many        :accountabilities, foreign_key: :user_id
  has_many        :shops, through: :accountabilities
  has_many        :menus, through: :shops
  has_many        :menu_sections, through: :menus

  validate        :has_manager?


private

  def has_manager?
    errors.add(:salesmanager, "not defined") unless self.supervision
  end
end
