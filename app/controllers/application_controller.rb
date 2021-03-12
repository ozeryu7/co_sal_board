class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:name]
    devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar))
  end

  #  :sign_up, keys: added_attrs

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to posts_path, alert: 'ゲストユーザーは変更・削除できません。'
    end
  end
end
