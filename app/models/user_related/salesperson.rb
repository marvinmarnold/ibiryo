class Salesperson < User
  has_one :supervision, foreign_key: :salesperson_id
  has_one :salesmanager, through: :supervision

  validate :has_manager?

private

  def has_manager?
    errors.add(:salesmanager, "not defined") unless self.supervision
  end
end
