class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # before_action :authenticate_admin!
  protect_from_forgery with: :exception

  private

  # def authenticate_admin!
  # # flash[:danger] = ""
  #   redirect to "/" unless current_user && current_user.admin?
  # end

  # def aunthenticate_eventcreator!
  #   redirect to "/" unless current_user && current_user.event_creator?
  # end
end
