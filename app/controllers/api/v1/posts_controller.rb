class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [ :show, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def update
    if @post.update(post_params)
      render :show
    else
      render_error
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:post_content)
  end

  def render_error
    render json: { errors: @post.errors.full_messages },
      status: :unprocessable_entity
  end
end
