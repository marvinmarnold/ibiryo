class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :default_locale

  validates :default_locale, :role_id, presence: true
  validates :role_id, inclusion: {in: 1..5}

  def role?(base_role)
    Role.find_by_name(base_role.to_s).id >= safe_role_id
  end

  def safe_role_id
    (self.role_id.present?) ? self.role_id : Role.find_by_name("guest").id
  end
end
