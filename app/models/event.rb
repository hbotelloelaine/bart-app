# require 'chronic'
class Event < ActiveRecord::Base
  belongs_to :station
  belongs_to :users
  has_many :links
  has_many :user_events
  has_many :users, through: :user_events



  def show
  if params[:id] = "random"
    @event = Event.all.sample
  else
    @event = Event.find_by(id: params[:id])
  end
end

  # validates_presence_of :start_at

  # def chronic_start_time
  #   self.start_at = Chronic.parse(self.start_at)
  # end
  # def chronic_end_time
  # end

  # def chronic_e_time=(s)
  #   self.start_at = Chronic.parse(s) if s
  # end
end