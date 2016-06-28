class Admin::MessagesController < Admin::ApplicationController
  def index
    if params[:search].present?
      @messages= Message.search(params[:search]).page params[:page]
    else
      @messages = Message.all.order("created_at DESC").page params[:page]
  end
end

  def show
    @message = Message.find(params[:id])
    @message.mark_read
  end

  def update
    @message = Message.find(params[:id])
    @message.update(status: params[:status])
    redirect_to :back, notice:"update successfully"
  end

  def destroy
    @message= Message.find(params[:id])
    @message.destroy
    redirect_to :back, notice:"was destroy successfully"
  end
end
