class Supervision < ActiveRecord::Base
  belongs_to :salesmanager
  belongs_to :salesperson
  attr_accessible :salesmanager_id
end
