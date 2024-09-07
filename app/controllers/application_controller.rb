class ApplicationController < ActionController::Base
    before_action :load_notifications

    private
  
    def load_notifications
      if user_signed_in?
        @calving_notifications = current_user.cows.select(&:approx_calving_within_a_week?)
        @harvest_notifications = current_user.fields.select(&:harvest_within_a_week?)
      end
    end
end
