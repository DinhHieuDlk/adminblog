class Admin::VisitorsController < Admin::ApplicationController
  def index
    @visitors = Visitor.all.order("created_at DESC")
  end

  def destroy
    @visitor = Visitor.find(params[:id]).destroy
    redirect_to :back, notice: "was successfully destroy..."
  end
  def delete_all
    Notification.delete_all
    redirect_to :back, notice:"delete_all notifications"
    #code
  end
end
