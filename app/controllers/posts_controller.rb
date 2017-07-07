class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all.order(created_at: :desc)
    self.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Successfully posted'
    else
      redirect_to @post, notice: "There seems to be something wrong."
    end
  end

  private

  def post_params
    params.require(:post).permit(:post)
  end
end
