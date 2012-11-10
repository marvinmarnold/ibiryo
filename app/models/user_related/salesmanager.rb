class Salesmanager < User
  has_many  :supervisions, foreign_key: :salesmanager_id
  has_many  :salespersons, through: :supervisions

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
