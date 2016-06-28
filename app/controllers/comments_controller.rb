class CommentsController < ApplicationController
  def create

 	@visitor = Visitor.new(visitor_params)
 	if @visitor.save
  		@comment = @visitor.comments.build(comment_params)
  		respond_to do |format|
  			if @comment.save
  				notifiable = Comment.find(@comment)
  				notification = Notification.new(notifiable_id: notifiable.id, notifiable_type: notifiable.class.name).save
  			 	format.html { redirect_to :back, notice: 'Message was successfully created.' }
             	format.json { render :show, status: :created, location: @message }
            else
              	format.html { render :new }
              	format.json { render json: @message.errors, status: :unprocessable_entity }

  			end
  		end
  	end
end
  def comment_params
  	params.require(:comment).permit(:post_id,:message)
  end
  def visitor_params
  	params.require(:visitor).permit(:fullname,:email)
  end
end
