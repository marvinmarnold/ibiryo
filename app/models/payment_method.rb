class PaymentMethod < Describable
  attr_accessible :database_name
  validates       :database_name, presence: true, uniqueness: true
end
