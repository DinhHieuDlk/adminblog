class MessagesController < ApplicationController


  # GET /messages/new
  def new
    @visitor_message = Visitor.new(messages:[Message.new])
  end

  # POST /messages
  # POST /messages.json
  def create
    @visitor= Visitor.new(visitor_params)
      if @visitor.save
          @message = @visitor.messages.build(message_params)
          if @message.save
              notifiable = Message.find(@message)
              notification = Notification.new(notifiable_id: notifiable.id , notifiable_type: notifiable.class.name ).save
              redirect_to :back , notice:'Message was successfully created.'
            else
              Visitor.find(@visitor).destroy
              redirect_to :back, notice:"message not send"
              
          end
      else
        redirect_to :back, notice:"message not send"
      end
      end 


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end
    def visitor_params
      params.require(:visitor).permit(:fullname, :email)
    end
end
