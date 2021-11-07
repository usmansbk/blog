class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], user: current_user)

    if comment.save
      flash[:notice] = 'Comment added!'
    else
      flash[:alert] = 'Failed to add comment!'
    end
    redirect_to user_post_path(post.user.id, post.id)
  end

  def destroy
    comment = Comment.find params[:id]
    post = comment.post

    if comment.destroy
      flash[:notice] = 'Comment removed!'
    else
      flash[:alert] = 'Failed to remove comment!'
    end
    redirect_to user_post_path(post.user.id, post.id)
  end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
