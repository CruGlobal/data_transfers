class MonitorsController < ApplicationController
  layout nil
  newrelic_ignore

  def lb
    render text: 'OK'
  end
end
