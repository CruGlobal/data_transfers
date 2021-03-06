class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  protected

  def ssl_configured?
    !Rails.env.development? && !Rails.env.test?
  end

  def authenticate_user!
    redirect_to("/session/new") unless current_user
  end

  def current_user=(user)
    user.track(request)
    Thread.current[:user_id] = session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    return unless session[:user_id]

    Thread.current[:user_id] = session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
