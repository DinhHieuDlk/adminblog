class Admin::CommentsController < Admin::ApplicationController
  before_action :set_commnet, only:[:update, :destroy]
  def index

  if params[:search].present?
    @comments= Comment.search(params[:search]).page params[:page]
  else
    if params[:status]
    @comments = Comment.where(status: to_boolean(params[:status])).page params[:page]
    else
    @comments = Comment.all.order("created_at DESC").page params[:page]
    end
  end
end
  def edit
    #code
  end
  def update
    respond_to do |format|
      # byebug
    if @comment.update(status: params[:status])
      format.html{ redirect_to admin_comments_path, notice:"comment was successfully update..."}
    else
      redirect_to :back
    end
end
  end

  def destroy
    @comment.destroy
    redirect_to admin_comments_path, notice:"was successfully destroy"
  end
  def set_commnet
    @comment = Comment.find(params[:id])
    #code
  end
end
