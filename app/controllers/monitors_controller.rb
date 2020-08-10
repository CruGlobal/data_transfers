class MonitorsController < ApplicationController
  skip_before_action :authenticate_user!
  layout nil

  def lb
    render plain: "OK"
  end
end
