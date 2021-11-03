class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
    @comments = @post.comments.all.order('created_at')
    @liked = @post.liked? current_user.id
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update; end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_post_path(@post.user.id, @post.id), notice: 'Published successfully!'
        else
          flash.now[:alert] = 'Failed to publish post!'
          render :new
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = post.user

    respond_to do |format|
      format.html do
        if post.destroy
          redirect_to user_path(user.id)
        else
          redirect_to user_path(user.id), alert: 'Failed to delete post!'
        end
      end
    end
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end
end
