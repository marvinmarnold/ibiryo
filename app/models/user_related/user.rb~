class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  belongs_to      :default_locale, class_name: "Locale"
  has_many        :feedbacks
  devise          :database_authenticatable, :registerable,
                  :recoverable,              :rememberable, :trackable,             :validatable

  attr_accessible :email,                     :password,    :password_confirmation, :remember_me,
                  :default_locale_id

  validates       :default_locale_id, :type, presence: true

  ROLES = %w[marvin admin salesmanager salesperson vendor customer guest]

  def role?(base_role)
    ROLES.index(base_role.to_s.downcase) >= ROLES.index(self.type.to_s.downcase)
  end

  def can_administrate?(shop)
    false
  end
end
