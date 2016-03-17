class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    @user = User.find_from_auth_hash(auth_hash)
    redirect_to '/users/no_access' and return unless @user

    self.current_user = @user
    redirect_to '/'
  end

  def destroy
    Thread.current[:user_id] = session[:user_id] = nil
    redirect_to "#{ENV['CAS_URL']}/logout"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
