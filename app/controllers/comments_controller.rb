class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]
  before_action :set_post

  def edit
    @comment = Comment.find(params[:id])
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_to("/posts/#{params[:post_id]}")
    else
      @post = Post.find(params[:post_id])
      flash.now[:alert] = "コメントの投稿に失敗しました。"
      render "posts/#{params[:post_id]}"
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end
  private
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end

    def authenticate_admin!
      @comment = Comment.find(params[:id])

      if @comment.user_id != current_user.id
        flash[:notice] = "権限はありませｎ"
        redirect_to post_path(@comment.post_id)
      end
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end