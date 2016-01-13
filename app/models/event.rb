class Event < ActiveRecord::Base
  belongs_to :station
  belongs_to :users
  has_many :events, through: :user_events
end
