class CommentsController < ApplicationController
  def create

 	@visitor = Visitor.new(visitor_params)
 	if @visitor.save
  		@comment = @visitor.comments.build(comment_params)
  			if @comment.save
          notifiable = Comment.find(@comment)
          notification = Notification.new(notifiable_id: notifiable.id, notifiable_type: notifiable.class.name).save
          redirect_to :back, notice:"Comment was successfully created."
             elsif
                Visitor.find(@visitor).destroy
              	redirect_to :back, notice:"comment not created"
  			end
  else
      redirect_to :back, notice:"comment not created"
  end
end
  def comment_params
  	params.require(:comment).permit(:post_id,:message)
  end
  def visitor_params
  	params.require(:visitor).permit(:fullname,:email)
  end
end
