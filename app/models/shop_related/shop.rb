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
  has_many        :menu_descriptions, through: :menus, source: :descriptions
  has_many        :menu_sections, through: :menus
  has_many        :menu_section_descriptions, through: :menu_sections, source: :descriptions
  has_many        :items, through: :menu_sections
  has_many        :item_descriptions, through: :items, source: :descriptions
  has_many        :options
  has_many        :choices
  mount_uploader  :banner, RestaurantBannerUploader
  mount_uploader  :thumbnail, RestaurantThumbnailUploader
  attr_accessible :banner,                :checkin_at,          :checkout_at,               :closes_friday_at,
                  :closes_monday_at,      :closes_saturday_at,  :closes_sunday_at,          :closes_thursday_at,
                  :closes_tuesday_at,     :closes_wednesday_at, :currency_id,               :delivery_fee,
                  :delivery_minimum,      :is_active,           :opens_friday_at,           :opens_monday_at,
                  :opens_saturday_at,     :opens_sunday_at,     :opens_thursday_at,         :opens_tuesday_at,
                  :opens_wednesday_at,    :thumbnail,           :tag_ids,                   :banner_cache,
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

  scope           :hotel, joins(:menus).where("menus.item_type_id" => 2)
  scope           :restaurant, joins(:menus).where("menus.item_type_id" => 1)
  scope           :not_shop, lambda { |shop| where(Shop.arel_table[:id].not_eq(shop.id)) }

  default_scope   { where(:is_active => true) }

  include PgSearch
  pg_search_scope :search, :associated_against => {
    :descriptions               => [:name, :body],
    :menu_descriptions          => [:name, :body],
    :menu_section_descriptions  => [:name, :body],
    :item_descriptions          => [:name, :body]
  }
  #pg_search_scope :search_by_classification, lambda do |classification_operator, query|
  #  raise ArgumentError unless [:is_hotel?, :is_restaurant?].include?(classification_operator)
  #  {
  #    :query => query,
  #    :if => classification_operator,
  #    :associated_against => {
  #      :descriptions               => [:name, :body],
  #      :menu_descriptions          => [:name, :body],
  #      :menu_section_descriptions  => [:name, :body],
  #      :item_descriptions          => [:name, :body],
  #
  #    }
  #  }
  #end

  def is_hotel?
    menus.where(item_type_id: 2).present?
  end

  def is_restaurant?
    menus.where(item_type_id: 1).present?
  end

  #
  # Tags
  #
  def tag_ids
    taggings.map(&:tag_id)
  end

  def tag_ids=(ids)
    taggings.delete_all
    ids.each do |tag_id|
      taggings.where(tag_id: tag_id).first_or_create unless tag_id.blank?
    end
  end

  def tag_list
    tags.map(&:name).join(", ")
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
