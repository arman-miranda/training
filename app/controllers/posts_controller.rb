class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all.order(
      created_at: :desc).includes(
        :user => :department).page(
          params[:page]
        )
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Successfully posted'
    else
      redirect_to @post, notice: "Your input is invalid."
    end
  end

  private

  def post_params
    params.require(:post).permit(:post)
  end
end
