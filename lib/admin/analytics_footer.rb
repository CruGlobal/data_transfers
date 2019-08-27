module Admin
  class AnalyticsFooter < ActiveAdmin::Views::Footer
    def build
      super
      render("layouts/analytics")
    end
  end
end
