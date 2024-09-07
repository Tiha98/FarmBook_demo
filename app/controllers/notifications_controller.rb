class NotificationsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @calving_notifications = current_user.cows.select(&:approx_calving_within_a_week?)
      @harvest_notifications = current_user.fields.select(&:harvest_within_a_week?)
    end
  end