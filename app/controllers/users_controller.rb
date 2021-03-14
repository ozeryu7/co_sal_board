class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    # @users = User.page
  end
 
  # def edit
  #   @user = User.find(params[:id])
  # end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)

    metoos = Metoo.where(user_id: current_user.id).pluck(:post_id)  # ログイン中のユーザーの行ったよのpost_idカラムを取得
    @metoo_list = Post.find(metoos)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

  def following
      #@userがフォローしているユーザー
      @user  = User.find(params[:id])
      @users = @user.following.page(params[:page]).per(5)
      render 'show_follow'
  end

  def follower
      #@userをフォローしているユーザー
      @user  = User.find(params[:id])
      @users = @user.followers.page(params[:page]).per(5)
      render 'show_follow'
  end

  private

  # ユーザー新規作成時に許可する属性
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end

    # プロフィール編集時に許可する属性
  def user_params_update
    params.require(:user).permit(:name, :email, :introduction, :familiar_place)
  end

    # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      flash[:danger] = "このページへはアクセスできません"
      redirect_to(root_url)
    end
  end
end