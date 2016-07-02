class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.map.with_index { |post, index| post.title.replace "SPAM" if (index == 0 || index % 5 == 0) }
  end

  def show
  end

  def new
  end

  def edit
  end
end
