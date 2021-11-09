class LikesController < ApplicationController
  def create
    post = Post.find params[:post_id]
    like = post.likes.new user: current_user

    flash[:alert] = 'Failed to like post!' unless like.save
    redirect_to user_post_path(post.user.id, post.id)
  end

  def destroy
    post = Post.find params[:id]

    flash[:alert] = 'Failed to unlike post!' unless post.users.delete current_user
    redirect_to user_post_path(post.user.id, post.id)
  end
end
