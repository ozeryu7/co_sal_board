class UsersController < ApplicationController
  def index
  end
 
  def show
    @user = User.find(params[:id])
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
end
