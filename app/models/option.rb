class Option < Describable
  belongs_to      :shop
  has_many        :possibilities
  has_many        :choices, through: :possibilities
  attr_accessible :max_allowed,   :min_required
  accepts_nested_attributes_for :possibilities
  validates       :min_required, :max_allowed, presence: true
  validates       :min_required,
                  :numericality => { greater_than_or_equal_to: 0 }
  validates       :max_allowed,
                  :numericality => { greater_than_or_equal_to: :min_required,
                  :message => I18n.t("options.form.errors.max_allowed") }
end
