class Possibility < ActiveRecord::Base
  belongs_to :option
  belongs_to :choice
  attr_accessible :choice_id
end
