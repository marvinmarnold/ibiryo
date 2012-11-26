class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  belongs_to      :default_locale, class_name: "Locale"
  has_many        :feedbacks
  has_many        :carts
  devise          :database_authenticatable, :registerable,
                  :recoverable,              :rememberable, :trackable,             :validatable
  #attr_accessor   :wants_to_be_vendor
  attr_accessible :email,                     :password,    :password_confirmation, :remember_me,
                  :default_locale_id

  validates       :default_locale_id, presence: true

  before_save     :set_to_customer

  ROLES = %w[marvin admin salesmanager salesperson vendor customer guest]

  def role?(base_role)
    ROLES.index(base_role.to_s.downcase) >= ROLES.index(self.type.to_s.downcase)
  end

  def current_cart_for(shop)
    self.carts.where("settled_at is NULL").where("updated_at > ?", 3.hours.ago).where(shop_id: shop.id).first_or_create
  end

private

  def set_to_customer
    self.type ||= "Customer"
  end
end
