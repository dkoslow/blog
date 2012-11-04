class PostsController < ApplicationController

  before_filter :admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      flash.now[:error] = "Post creation unsuccessful."
      render :new
    end
  end

  def edit
    @post = Post.find_by_url_slug(params[:id])
  end

  def update
    @post = Post.find_by_url_slug(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated!"
      redirect_to @post
    else
      flash.now[:error] = "Post update unsuccessful."
      render :edit
    end
  end

  def show
    @post = Post.find_by_url_slug(params[:id])
  end

  def index
    @posts = Post.page(params[:page]).per_page(20)
  end

  def destroy
    @post = Post.find_by_url_slug(params[:id])
    @post.destroy
    flash[:success] = "Post destroyed."
    redirect_to root_url
  end

  private

    def admin
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end
