class Feedback < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :first_name, :last_name, :subject
end
