class MenuSection < Describable
  belongs_to        :menu
  has_many          :items
  attr_accessible   :is_active
  validates         :is_active,
                    :inclusion => { :in => [true, false],
                                  :message => I18n.t("shops_shared.form.errors.is_active")}
end
