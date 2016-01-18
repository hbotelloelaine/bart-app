class User < ActiveRecord::Base
  has_many :user_events
  has_many :events, through: :user_events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # def event_creator
  #   current_user = 
  # end
end
