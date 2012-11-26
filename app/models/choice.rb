class Choice < Describable
  belongs_to :shop
  attr_accessible :is_active, :price
  attr_accessible   :is_active
  validates         :is_active,
                    :inclusion => { :in => [true, false],
                                  :message => I18n.t("shops_shared.form.errors.is_active")}
  validates         :price, :numericality => { greater_than_or_equal_to: 0 }
end
