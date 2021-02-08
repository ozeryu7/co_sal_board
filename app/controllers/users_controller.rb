class UsersController < ApplicationController

  def index
    @users = User.page
  end
 
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private

  # プロフィール編集時に許可する属性
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction, :sex)
  end
end
