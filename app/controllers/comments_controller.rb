class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], user: current_user)

    respond_to do |format|
      if comment.save
        format.html { redirect_to user_post_path(post.user.id, post.id), notice: 'Comment added!' }
      else
        format.html { redirect_to user_post_path(post.user.id, post.id), alert: 'Failed to add comment!' }
      end
    end
  end

  # def destroy
  #   comment = Comment.find params[:id]
  #   post = comment.post

  #   respond_to do |format|
  #     if comment.destroy
  #       format.html { redirect_to user_post_path(post.user.id, post.id), notice: 'Comment deleted!' }
  #     else
  #       format.html { redirect_to user_post_path(post.user.id, post.id), alert: 'Failed to delete comment!' }
  #     end
  #   end
  # end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
