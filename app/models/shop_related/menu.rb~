class Menu < Describable
  belongs_to        :shop
  has_many          :menu_sections
  attr_accessible   :is_active
  validates         :is_active,
                    :inclusion => { :in => [true, false],
                                  :message => I18n.t("shops_shared.form.errors.is_active")}
end
