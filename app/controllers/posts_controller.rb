class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if params[:tag]
      @posts = Post.filter_by_tag(params[:tag]).page(params[:page]).per(Setting.post_per_page)
    else
      @posts = Post.where(publish:true).order("created_at DESC").page(params[:page]).per(Setting.post_per_page)
    end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @visitor_comment = Visitor.new(comments:[Comment.new])
  end

  # GET /posts/new

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
end
