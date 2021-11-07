class Api::PostsController < ApplicationController
  load_and_authorize_resource
  # skip_authorize_resource only: :all_posts

  def index
    @posts = Post.all.order('created_at')
    render json: { status: 'success', data: { posts: @posts } }
  end
end
