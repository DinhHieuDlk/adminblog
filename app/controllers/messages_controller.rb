class MessagesController < ApplicationController


  # GET /messages/new
  def new
    @visitor_message = Visitor.new(messages:[Message.new])
  end

  # POST /messages
  # POST /messages.json
  def create
    @visitor = Visitor.find_by(email: message_params[:email])
    if @visitor
      @visitor.tap do |m|
        m.messages << Message.new(message_params[:messages_attributes] ['0'])
         redirect_to new_message_path , notice:'Message was successfully created.'
      end
    else
    @visitor= Visitor.new(message_params)
      if @visitor.save
              redirect_to new_message_path , notice:'Message was successfully created.'
      else
        redirect_to new_message_path
      end
    end
end 


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def  message_params
      params.require(:visitor).permit(:fullname, :email, :messages_attributes =>[:content])
    end
end
