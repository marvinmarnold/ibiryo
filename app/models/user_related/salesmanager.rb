class Salesmanager < User
  has_many  :supervisions, foreign_key: :salesmanager_id
  has_many  :salespersons, through: :supervisions
  has_many  :shops, through: :salespersons
  has_many  :menus, through: :shops

  def can_administrate?(shop)
    managing?(shop) or can_administrate_through?(shop)
  end

private
  def can_administrate_through?(shop)
    salespersons.each do |s|
      if s.managing?(shop)
        return true
      end
    end
    return false
  end
end
