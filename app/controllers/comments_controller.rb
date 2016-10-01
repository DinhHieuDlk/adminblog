class CommentsController < ApplicationController
  def create
          @visitor = Visitor.find_by(email: visitor_comment_params[:email] )
       if @visitor
                @visitor.tap do |v|
                    v.comments << Comment.new(visitor_comment_params[:comments_attributes] ['0'])
                     redirect_to :back, notice:"Comment was successfully created."
                end
      else
            @visitor = Visitor.new(visitor_comment_params)
              if @visitor.save
                        redirect_to :back, notice:"Comment was successfully created."
              else
                    redirect_to :back, notice:"comment not created"
              end
      end
end
private
  def visitor_comment_params
    params.require(:visitor).permit(:fullname,:email, :comments_attributes =>[:message, :post_id])
  end
end
