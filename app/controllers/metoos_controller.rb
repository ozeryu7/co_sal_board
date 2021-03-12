class MetoosController < ApplicationController
    before_action :set_post
    # before_aciton :authenticate_user!

  def create
    if @post.user_id != current_user.id
      @metoo = Metoo.create(user_id: current_user.id, post_id: @post.id)
    end
  end

  def destroy
    @metoo = Metoo.find_by(user_id: current_user.id, post_id: @post.id).destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
