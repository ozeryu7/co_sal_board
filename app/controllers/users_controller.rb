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
    @title = "フォロー中"
    @user  = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(5)
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
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