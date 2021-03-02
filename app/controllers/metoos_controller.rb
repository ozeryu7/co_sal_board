class MetoosController < ApplicationController
    before_action :setting_post

  def create
    Metoo.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    Metoo.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
  end

  private

  def setting_post
    @post = Post.find(params[:post_id])
  end
end
