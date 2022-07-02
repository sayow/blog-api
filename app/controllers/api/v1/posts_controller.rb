# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: %i[show update destroy]

      def index
        @posts = Post.all
      end

      def show
        @subcomment = Subcomment.find(params[:id])
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
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:post_content, :user_id)
      end

      def render_error
        render json: { errors: @post.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end
end
