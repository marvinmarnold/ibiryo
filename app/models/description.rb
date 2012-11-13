class Description < ActiveRecord::Base
  belongs_to :locale
  attr_accessible :body, :name, :locale_id
  validates :name, :locale_id, presence: true
end
