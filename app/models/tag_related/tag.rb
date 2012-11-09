class Tag < ActiveRecord::Base
  belongs_to      :synonym
  has_many        :taggings
end
