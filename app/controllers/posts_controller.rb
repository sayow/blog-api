require 'json'
require 'open-uri'

class PostsController < ApplicationController

  def home
    @get_posts = get_posts?
  end

  def show
    @get_posts = get_posts?
    @post = @post.find(params[:id])
  end


  private

  def get_posts?
    url = 'http://localhost:3000/api/v1/posts'
    posts = URI.open(url).read
    @post = JSON.parse(posts)
  end

end
