class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]


  def index
    @users = User.page
  end
 
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
  end

    def following
        #@userがフォローしているユーザー
        @user  = User.find(params[:id])
        @users = @user.following
        render 'show_follow'
    end

    def follower
        #@userをフォローしているユーザー
        @user  = User.find(params[:id])
        @users = @user.followers
        render 'show_follower'
    end

  private

  # ユーザー新規作成時に許可する属性
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end

    # プロフィール編集時に許可する属性
  def user_params_update
    params.require(:user).permit(:name, :email, :introduction, :sex)
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