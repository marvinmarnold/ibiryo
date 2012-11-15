class Locale < ActiveRecord::Base
  attr_accessible :abbr, :language, :is_default
end
