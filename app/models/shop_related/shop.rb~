class Shop < Describable

  has_many        :accountabilities
  has_many        :users
  has_many        :taggings
  has_many        :tags, through: :taggings
  has_one         :contact, as: :contactable
  has_many        :ownerships
  has_many        :accountabilities
  has_many        :participations
  has_many        :marketing_strategies, through: :participations
  belongs_to      :currency
  has_many        :menus
  has_many        :options
  has_many        :choices
  mount_uploader  :banner, RestaurantBannerUploader
  mount_uploader  :thumbnail, RestaurantThumbnailUploader
  attr_accessible :banner,                :checkin_at,          :checkout_at,               :closes_friday_at,
                  :closes_monday_at,      :closes_saturday_at,  :closes_sunday_at,          :closes_thursday_at,
                  :closes_tuesday_at,     :closes_wednesday_at, :currency_id,               :delivery_fee,
                  :delivery_minimum,      :is_active,           :opens_friday_at,           :opens_monday_at,
                  :opens_saturday_at,     :opens_sunday_at,     :opens_thursday_at,         :opens_tuesday_at,
                  :opens_wednesday_at,    :thumbnail,           :tag_list,                  :banner_cache,
                  :thumbnail_cache,       :contact_attributes,  :participations_attributes, :accountabilities_attributes,
                  :ownerships_attributes

  accepts_nested_attributes_for           :participations,      :contact,                   :ownerships,
                                          :accountabilities
  validates       :banner,                :closes_friday_at,    :closes_monday_at,          :closes_saturday_at,
                  :closes_sunday_at,      :closes_thursday_at,  :closes_tuesday_at,         :closes_wednesday_at,
                  :currency_id,           :delivery_fee,        :delivery_minimum,          :opens_friday_at,
                  :opens_monday_at,       :opens_saturday_at,   :opens_sunday_at,           :opens_thursday_at,
                  :opens_tuesday_at,      :opens_wednesday_at,  :thumbnail,
                  presence: true
  validates       :delivery_fee,          :delivery_minimum,
                  :numericality => { greater_than_or_equal_to: 0 }
  validates       :is_active,
                  :inclusion => { :in => [true, false],
                                  :message => I18n.t("shops_shared.form.errors.is_active")}
  #validate        :one_owner
  validate        :one_accountable
  #def to_param
  #  "#{id} #{name}".parameterize
  #end

  def is_hotel?
    false
  end

  def is_restaurant?
    true
  end

  #
  # Tags
  #

  def self.tagged_with(name)
    Tag.find_by_name!(name).vendors
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.find_or_create_by_name(n.strip)
    end
  end

  def self.page_param
    "spage"
  end

  def self.vendor_page_param
    "vpage"
  end

private

  def one_owner
    errors[:ownerships] << I18n.t('shops.form.errors.atleast_one_owner') if ownerships.blank?
  end

  def one_accountable
    errors[:accountabilities] << I18n.t('shops.form.errors.atleast_one_accountable') if accountabilities.blank?
  end
end
