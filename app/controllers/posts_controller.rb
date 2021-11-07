class PostsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :all_posts

  def index
    @user = User.find params[:user_id]
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @user = User.find params[:user_id]
    @post = @user.posts.includes(:comments).find(params[:id])
    @comments = @post.comments.all.order('created_at')
    @liked = @post.liked? current_user.id
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    if @post.update post_params
      redirect_to user_post_path(@post.user.id, @post.id), notice: 'Published successfully!'
    else
      render :new
    end
  end

  def create
    @post = current_user.posts.new post_params

    if @post.save
      redirect_to user_post_path(@post.user.id, @post.id), notice: 'Published successfully!'
    else
      render :new
    end
  end

  def destroy
    post = Post.find params[:id]
    user = post.user

    if post.destroy
      redirect_to user_path(user.id), notice: 'Post deleted!'
    else
      redirect_to user_path(user.id), alert: 'Failed to delete post!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
