class ApplicationController < ActionController::Base
  extend ActiveSupport::Memoizable
  protect_from_forgery

  helper_method :current_user_session, :current_user

  private

  def current_user_session
    @current_user_session = UserSession.find
  end
  memoize :current_user_session

  def current_user
    @current_user = current_user_session && current_user_session.user
  end
  memoize :current_user

  def require_user
    unless current_user
      session[:return_to] = request.get? ? request.request_uri : request.referer
      flash[:notice] = "Please log in to view this page."
      redirect_to new_user_session_url
      return false
    end
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
