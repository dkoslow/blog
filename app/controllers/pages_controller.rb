class PagesController < ApplicationController
  def home
    @posts = Post.find(:all)
  end
end
