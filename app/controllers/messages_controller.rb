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
          respond_to do |format|
          if @message.save
              notifiable = Message.find(@message)
              notification = Notification.new(notifiable_id: notifiable.id , notifiable_type: notifiable.class.name ).save
              format.html { redirect_to new_message_path, notice: 'Message was successfully created.' }
              format.json { render :show, status: :created, location: @message }
            else
              format.html { render :new }
              format.json { render json: @message.errors, status: :unprocessable_entity }
          end
        end
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
