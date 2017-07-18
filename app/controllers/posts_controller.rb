class PostsController < ApplicationController
  before_action :set_post, only:[:destroy]
  before_action :authenticate_user!
  def index
    @posts = Post.all.order(
      created_at: :desc).includes(
        :user => :department).page(
          params[:page]
        )
    @post = Post.new

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Successfully posted'
    else
      redirect_to @post, alert: "Your input is invalid."
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html {redirect_to posts_url, notice: "Successfully Deleted"}
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:post)
  end
end
