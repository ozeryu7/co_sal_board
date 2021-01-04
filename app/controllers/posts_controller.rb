class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).all.order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build(user_id: current_user.id, post_id: @post.id) if current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to root_url
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render("posts/new")
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to root_url
    else
      flash.now[:alert] = "編集に失敗しました。"
      render("/posts/edit")
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def authenticate_admin!
    if @post.user_id != current_user.id
      flash[:notice] = "権限はありません"
      redirect_to root_url
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to("/posts/#{@post.id}")
    end
  end

end
