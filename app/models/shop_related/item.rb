class Item < Describable
  belongs_to        :menu_section
  has_many          :line_items
  has_many          :customizations
  has_many          :options, through: :customizations
  attr_accessible   :is_active, :price, :customizations_attributes
  accepts_nested_attributes_for   :customizations
  validates         :is_active,
                    :inclusion => { :in => [true, false],
                    :message => I18n.t("shops_shared.form.errors.is_active")}
  validates         :price, :numericality => { greater_than_or_equal_to: 0 }

  def fixed_price?
    customizations.blank?
  end

end
