class UserEvent < ActiveRecord::Base
  belongs_to :events
  belongs_to :users
  
end
