class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :default_locale

  validates :default_locale, :type, presence: true

  ROLES = %w[marvin admin salesmanager salesperson vendor customer guest]

  def role?(base_role)
    ROLES.index(base_role.to_s) >= ROLES.index(self.type)
  end

  def can_administrate?(shop)
    false
  end
end
