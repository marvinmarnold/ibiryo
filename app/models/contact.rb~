class Contact < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true

  attr_accessible :city,      :directions,    :district,    :nickname,    :primary_phone,
                  :province,  :room,          :secondary_phone,           :street,          :type

  validates :street, :district, :city, presence: true
  validates :province, :primary_phone, presence: true
  validates :primary_phone, :secondary_phone, :format => {with: /(^$|^\d{9})/}

  def phones
    addition = (secondary_phone.blank?) ? "" : ", #{secondary_phone}"
    "#{primary_phone}#{addition}"
  end
end
