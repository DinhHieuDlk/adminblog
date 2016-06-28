class Admin::NotificationsController < Admin::ApplicationController
  def index
    @visitor_notification = Notification.where(notifiable_type: "Visitor").order("created_at DESC")
    @comment_notification = Notification.where(notifiable_type: "Comment").order("created_at DESC")
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to admin_notifications_path, notice:"was destroy notification"
  end
  def delete_all
  	Notification.delete_all
  	redirect_to :back, notice: 'All notifications deleted successfully'
  end
end


