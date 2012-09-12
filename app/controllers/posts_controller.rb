class PostsController < ApplicationController
  def show
    @post = Post.find_by_url_slug(params[:id])
  end

  def index
    @posts = Post.page(params[:page]).per_page(20)
  end
end
