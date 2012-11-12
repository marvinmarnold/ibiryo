class Shop < Describable

  has_many        :accountabilities
  has_many        :users
  has_many        :taggings
  has_many        :tags, through: :taggings
  has_one         :contact, as: :contactable
  has_one         :ownership
  has_many        :accountabilities
  has_many        :participations
  has_many        :marketing_strategies, through: :participations
  mount_uploader  :banner, RestaurantBannerUploader
  mount_uploader  :thumbnail, RestaurantThumbnailUploader
  attr_accessible :banner,              :checkin_at,          :checkout_at,           :closes_friday_at,
                  :closes_monday_at,    :closes_saturday_at,  :closes_sunday_at,      :closes_thursday_at,
                  :closes_tuesday_at,   :closes_wednesday_at, :currency,              :delivery_fee,
                  :delivery_minimum,    :is_active,           :opens_friday_at,       :opens_monday_at,
                  :opens_saturday_at,   :opens_sunday_at,     :opens_thursday_at,     :opens_tuesday_at,
                  :opens_wednesday_at,  :thumbnail,           :tag_list,              :banner_cache,
                  :thumbnail_cache,     :contact_attributes,  :participations_attributes

  accepts_nested_attributes_for :participations, :contact

  validates       :banner,              :closes_friday_at,    :closes_monday_at,    :closes_saturday_at,
                  :closes_sunday_at,    :closes_thursday_at,  :closes_tuesday_at,   :closes_wednesday_at,
                  :currency,            :delivery_fee,        :delivery_minimum,    :opens_friday_at,
                  :opens_monday_at,     :opens_saturday_at,   :opens_sunday_at,     :opens_thursday_at,
                  :opens_tuesday_at,    :opens_wednesday_at,  :thumbnail,
                  presence: true
  validates       :delivery_fee,        :delivery_minimum,
                  :numericality => { greater_than_or_equal_to: 0 }
  validates       :is_active,
                  :inclusion => { :in => [true, false], :message => I18n.t("shops.form.errors.is_active")}

  #def to_param
  #  "#{id} #{name}".parameterize
  #end

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
end
