class Api::CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    @comments = Comment.where({ post_id: params[:post_id] }).order('created_at')
    render json: { status: 'success', data: { comments: @comments } }
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(text: comment_params[:text], user: current_user)

    respond_to do |format|
      if comment.save
        format.json { render json: { status: 'success', data: { comment: comment } }, status: :created }
      else
        format.json { render json: { status: 'fail', errors: comment.errors }, status: :bad_request }
      end
    end
  end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
