require 'json'
require 'open-uri'

class PostsController < ApplicationController
  before_action :set_get_post, only: [:show, :edit, :update, :destroy]

  def index
    @get_posts = get_posts?
    @get_posts
  end

  def show
  end

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(get_post_params)
    if @get_post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @get_post.update(get_post_params)
      redirect_to home_path
    else
      render :edit
    end
  end

  def destroy
    @get_post.destroy
    redirect_to home_path
  end

  private

  def get_posts?
    url = 'http://localhost:3000/api/v1/posts'
    posts = URI.open(url).read
    @post = JSON.parse(posts)
  end

  def get_post_params
    params.require(:get_post).permit(:post_content, :user_id, :id)
  end

  def set_get_post
    @get_post = Post.find(params[:id])
  end


end
