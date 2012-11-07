class Shop < ActiveRecord::Base
  belongs_to :user
  attr_accessible :banner, :checkin_at, :checkout_at, :closes_friday_at, :closes_monday_at, :closes_saturday_at, :closes_sunday_at, :closes_thursday_at, :closes_tuesday_at, :closes_wednesday_at, :currency, :delivery_fee, :delivery_minimum, :is_active, :opens_friday_at, :opens_monday_at, :opens_saturday_at, :opens_sunday_at, :opens_thursday_at, :opens_tuesday_at, :opens_wednesday_at, :thumbnail
end
