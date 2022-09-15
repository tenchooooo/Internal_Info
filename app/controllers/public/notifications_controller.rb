class Public::NotificationsController < ApplicationController
  before_action :authenticate_member!, except: [:top]
  def index
    @notifications = current_member.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
