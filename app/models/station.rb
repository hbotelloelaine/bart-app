class Station < ActiveRecord::Base
  has_many :events
end
