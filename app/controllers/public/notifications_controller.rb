class Public::NotificationsController < ApplicationController
  before_action :authenticate_member!, except: [:top]
  before_action :member_is_approval
  def member_is_approval
    if current_member.is_approval != true
      redirect_to  member_path(current_member.id)
      flash[:alert] = "運営承認前です"
    end
  end
  def index
    @notifications = current_member.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end