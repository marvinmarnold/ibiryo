class Salesmanager < User
  has_many  :supervisions, foreign_key: :salesmanager_id
  has_many  :salespersons, through: :supervisions
  def can_administrate?(shop)

  end
end
