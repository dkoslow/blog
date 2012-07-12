class PagesController < ApplicationController
  require 'will_paginate/array'

  def home
    @posts = Post.page(params[:page]).per_page(6)
  end
end
