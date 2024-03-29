class Menu < Describable
  belongs_to        :shop
  belongs_to        :item_type
  has_many          :menu_sections
  attr_accessible   :is_active, :item_type_id
  validates         :is_active,
                    :inclusion => { :in => [true, false],
                                  :message => I18n.t("shops_shared.form.errors.is_active")}
  validates         :item_type_id, presence: true
end
