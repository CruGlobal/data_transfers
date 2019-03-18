class MonitorsController < ApplicationController
  skip_before_action :authenticate_user!
  layout nil
  newrelic_ignore

  def lb
    render plain: 'OK'
  end
end
