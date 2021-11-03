class LikesController < ApplicationController
  def create
    post = Post.find params[:post_id]
    like = post.likes.new user: current_user

    respond_to do |format|
      if like.save
        format.html { redirect_to user_post_path(post.user.id, post.id) }
      else
        format.html { redirect_to user_post_path(post.user.id, post.id), alert: 'Failed to like post!' }
      end
    end
  end

  def destroy
    post = Post.find params[:id]

    respond_to do |format|
      if post.users.delete current_user
        format.html { redirect_to user_post_path(post.user.id, post.id) }
      else
        format.html { redirect_to user_post_path(post.user.id, post.id), alert: 'Failed to unlike post!' }
      end
    end
  end
end
