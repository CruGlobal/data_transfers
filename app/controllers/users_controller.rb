class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:no_access]

  def no_access
    redirect_to '/' if current_user
  end
end
