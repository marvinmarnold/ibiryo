class Salesperson < User
  has_one         :supervision, foreign_key: :salesperson_id
  has_one         :salesmanager, through: :supervision
  has_many        :accountabilities
  has_many        :shops, through: :accountabilities
  has_many        :menus, through: shops

  validate        :has_manager?

  def managing?(shop)
    shops.include?(shop)
  end

private

  def has_manager?
    errors.add(:salesmanager, "not defined") unless self.supervision
  end
end
